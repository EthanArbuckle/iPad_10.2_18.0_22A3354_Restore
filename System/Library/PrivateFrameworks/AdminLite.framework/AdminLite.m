uint64_t AdminLiteNVRAMSet(const char *a1, const char *a2, int a3)
{
  uint64_t v3;
  uint64_t v7;
  FILE *v8;
  const char *v9;
  FILE *v10;
  char *v11;
  unsigned int v13;
  mach_port_t sp;

  v3 = 1;
  if (a1 && a2)
  {
    sp = 0;
    v7 = bootstrap_look_up(*MEMORY[0x24BDAD2F0], "com.apple.AdminLite", &sp);
    if ((_DWORD)v7)
    {
      v3 = v7;
      v8 = (FILE *)*MEMORY[0x24BDAC8D8];
      v9 = bootstrap_strerror(v7);
      fprintf(v8, "bootstrap_look_up(): %s\n", v9);
    }
    else
    {
      v13 = 0;
      v3 = nvram_set(sp, a1, a2, a3, &v13);
      mach_port_deallocate(*MEMORY[0x24BDAEC58], sp);
      if ((_DWORD)v3)
      {
        v10 = (FILE *)*MEMORY[0x24BDAC8D8];
        v11 = mach_error_string(v3);
        fprintf(v10, "nvram_set(): %08x %s\n", v3, v11);
        return v13;
      }
    }
  }
  return v3;
}

uint64_t nvram_set(mach_port_name_t a1, const char *a2, const char *a3, int a4, _DWORD *a5)
{
  uint64_t (*v9)(_QWORD, _QWORD, _QWORD);
  int v10;
  uint64_t v11;
  int v12;
  char *v13;
  char *v14;
  char *v15;
  int v16;
  uint64_t v17;
  mach_msg_size_t v18;
  mach_port_name_t reply_port;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  mach_port_name_t rcv_name[4];
  __int128 v25;
  _OWORD v26[129];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  memset(v26, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v25 = 0u;
  *((_QWORD *)&v25 + 1) = *MEMORY[0x24BDAC470];
  v9 = MEMORY[0x24BDAEF18];
  if (MEMORY[0x24BDAEF18])
    v10 = mig_strncpy_zerofill((char *)v26 + 8, a2, 1024);
  else
    v10 = mig_strncpy((char *)v26 + 8, a2, 1024);
  LODWORD(v26[0]) = 0;
  DWORD1(v26[0]) = v10;
  v11 = (v10 + 3) & 0xFFFFFFFC;
  v12 = v11 + 52;
  v13 = (char *)rcv_name + v11;
  v14 = v13 - 1024;
  v15 = v13 + 48;
  if (v9)
    v16 = mig_strncpy_zerofill(v15, a3, 1024);
  else
    v16 = mig_strncpy(v15, a3, 1024);
  *((_DWORD *)v14 + 267) = v16;
  *((_DWORD *)v14 + 266) = 0;
  v17 = (v16 + 3) & 0xFFFFFFFC;
  v18 = v12 + v17;
  *(_DWORD *)&v14[v17 + 1072] = a4;
  reply_port = mig_get_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v25 = 0x303900000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    reply_port = rcv_name[3];
  }
  v20 = mach_msg((mach_msg_header_t *)rcv_name, 3, v18, 0x30u, reply_port, 0, 0);
  v21 = v20;
  if ((v20 - 268435458) > 0xE || ((1 << (v20 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v20)
    {
      mig_dealloc_reply_port(rcv_name[3]);
      return v21;
    }
    if (DWORD1(v25) == 71)
    {
      v21 = 4294966988;
    }
    else if (DWORD1(v25) == 12445)
    {
      if ((rcv_name[0] & 0x80000000) == 0)
      {
        if (rcv_name[1] == 40)
        {
          if (!rcv_name[2])
          {
            v21 = LODWORD(v26[0]);
            if (!LODWORD(v26[0]))
            {
              *a5 = DWORD1(v26[0]);
              return v21;
            }
            goto LABEL_29;
          }
        }
        else if (rcv_name[1] == 36)
        {
          if (rcv_name[2])
            v22 = 1;
          else
            v22 = LODWORD(v26[0]) == 0;
          if (v22)
            v21 = 4294966996;
          else
            v21 = LODWORD(v26[0]);
          goto LABEL_29;
        }
      }
      v21 = 4294966996;
    }
    else
    {
      v21 = 4294966995;
    }
LABEL_29:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v21;
  }
  mig_put_reply_port(rcv_name[3]);
  return v21;
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x24BDAD2E0](*(_QWORD *)&bp, service_name, sp);
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x24BDAD308](*(_QWORD *)&r);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x24BDAEB90](a1);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x24BDAEEE0](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x24BDAEEF8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x24BDAEF08](*(_QWORD *)&reply_port);
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x24BDAEF10](dest, src, *(_QWORD *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x24BDAEF18](dest, src, *(_QWORD *)&len);
}

