uint64_t queryCompressionInfo(char *a1, uint64_t a2)
{
  if (a1 && a2)
    return sub_2063243D8(a1, -1, a2, 0);
  *__error() = 22;
  return 0xFFFFFFFFLL;
}

uint64_t decompressWithCallback(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _QWORD *a7, uint64_t a8)
{
  _QWORD v9[3];

  v9[0] = a8;
  v9[1] = a1;
  v9[2] = a2;
  return sub_2063299B8((uint64_t)v9, a3, a4, a5, a6, a7, (uint64_t)a7, a8);
}

_DWORD *sub_2063235E8(char *path, int fd)
{
  ssize_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _DWORD *v21;
  void *v22;
  ssize_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  if (fd == -1)
    v4 = getxattr(path, "com.apple.decmpfs", 0, 0, 0, 32);
  else
    v4 = fgetxattr(fd, "com.apple.decmpfs", 0, 0, 0, 32);
  v12 = v4;
  if (v4 == -1)
  {
    if (*__error() != 93)
    {
      v13 = __error();
      strerror(*v13);
      sub_206324734(CFSTR("%s:%d: getxattr(%s): %s\n"), v14, v15, v16, v17, v18, v19, v20, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
    }
    return 0;
  }
  if ((unint64_t)v4 <= 0xF)
  {
    sub_206324734(CFSTR("%s:%d: Error: size of %s EA is too small (%zd < %zu)\n"), v5, v6, v7, v8, v9, v10, v11, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
    return 0;
  }
  if (v4 >= 0x100000000)
  {
    sub_206324734(CFSTR("%s:%d: Error: size of %s EA is too big (%zd)\n"), v5, v6, v7, v8, v9, v10, v11, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
    return 0;
  }
  v21 = malloc(v4 + 4);
  v22 = v21 + 1;
  if (fd == -1)
    v23 = getxattr(path, "com.apple.decmpfs", v22, v12, 0, 32);
  else
    v23 = fgetxattr(fd, "com.apple.decmpfs", v22, v12, 0, 32);
  if (v23 != v12)
  {
    sub_206324734(CFSTR("%s:%d: Error: size of %s EA changed\n"), v24, v25, v26, v27, v28, v29, v30, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
    return 0;
  }
  *v21 = v12;
  return v21;
}

uint64_t catFile()
{
  const char *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  ssize_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE __b[4096];
  uint64_t v24;

  v0 = (const char *)MEMORY[0x24BDAC7A8]();
  v24 = *MEMORY[0x24BDAC8D0];
  if (v1 && (v2 = sub_2063238EC(), v2 != 93))
  {
    if (v2)
      return 0xFFFFFFFFLL;
    else
      return 0;
  }
  else
  {
    v3 = open(v0, 0);
    if (v3 == -1)
    {
      v14 = __error();
      strerror(*v14);
      sub_206324734(CFSTR("%s:%d: open(%s): %s\n"), v15, v16, v17, v18, v19, v20, v21, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
      return 0xFFFFFFFFLL;
    }
    else
    {
      v4 = v3;
      memset(__b, 170, sizeof(__b));
      while (1)
      {
        v5 = read(v4, __b, 0x1000uLL);
        if (!v5)
          break;
        if (write(1, __b, v5) != v5)
        {
          v6 = __error();
          strerror(*v6);
          sub_206324734(CFSTR("%s:%d: write: %s\n"), v7, v8, v9, v10, v11, v12, v13, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
          v5 = 0xFFFFFFFFLL;
          break;
        }
      }
      close(v4);
    }
  }
  return v5;
}

uint64_t sub_2063238EC()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t i;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  ssize_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  ssize_t v37;
  int *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD v82[3];
  uint64_t *v83;
  uint64_t v84;
  unsigned int v85;
  unsigned int v86;
  ssize_t value;
  _OWORD __b[256];
  uint64_t v89;

  v0 = (char *)MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v3 = v0;
  v89 = *MEMORY[0x24BDAC8D0];
  v4 = sub_2063235E8(v0, -1);
  if (v4)
  {
    v11 = v4;
    v82[0] = 0;
    v82[1] = v3;
    v82[2] = v4;
    sub_2063290DC((int *)&v83, (uint64_t)v82, v5, v6, v7, v8, v9, v10);
    if (HIDWORD(v84) != 196608 && HIDWORD(v84) != 0x20000)
    {
      if (HIDWORD(v84) == 0x10000)
        goto LABEL_5;
      sub_206324734(CFSTR("%s:%d: %s: unknown chunking scheme %llu\n"), v12, v13, v14, v15, v16, v17, v18, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
      goto LABEL_25;
    }
    v86 = 0;
    LOWORD(__b[3]) = -21846;
    *(_QWORD *)&v26 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __b[1] = v26;
    __b[2] = v26;
    __b[0] = v26;
    if (HIDWORD(v84) == 0x20000)
      v27 = 8 * v85 + 314;
    else
      v27 = 4 * (v85 + 1);
    v28 = *v83;
    if (*v83)
    {
      value = 0;
      v29 = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, ssize_t *))(v28 + 16))(v28, 0, 0, 0, &value);
      v86 = v29;
      if ((_DWORD)v29)
      {
        v25 = v29;
        sub_206324734(CFSTR("%s:%d: %s: readRscData: (0, 0), returned error [%d]"), v30, v31, v32, v33, v34, v35, v36, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
LABEL_26:
        strerror(v25);
        sub_206324734(CFSTR("%s:%d: validate(%s): %s\n"), v53, v54, v55, v56, v57, v58, v59, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
LABEL_27:
        free(v11);
        return v25;
      }
      v37 = value;
      if (value == -1)
      {
LABEL_5:
        for (i = 0; ; i += v23)
        {
          value = 0;
          memset(__b, 170, sizeof(__b));
          v83 = (uint64_t *)__b;
          v84 = 4096;
          v22 = sub_2063299B8((uint64_t)v82, i, 4096, 1, &v83, &value, v20, v21);
          if ((_DWORD)v22)
          {
            v25 = v22;
            strerror(v22);
            sub_206324734(CFSTR("%s:%d: decompress: %s\n"), v46, v47, v48, v49, v50, v51, v52, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
            goto LABEL_27;
          }
          v23 = value;
          if (!value)
          {
            v25 = 0;
            goto LABEL_27;
          }
          v24 = (*(uint64_t (**)(uint64_t, _OWORD *, ssize_t))(v2 + 16))(v2, __b, value);
          if ((_DWORD)v24)
            break;
        }
        v25 = v24;
        goto LABEL_27;
      }
    }
    else
    {
      v37 = getxattr((const char *)v83[1], "com.apple.ResourceFork", 0, 0, 0, 32);
      if (v37 == -1)
      {
        v38 = __error();
        strerror(*v38);
        sub_206324734(CFSTR("%s:%d: %s: fgetxattr: %s\n"), v39, v40, v41, v42, v43, v44, v45, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
        v25 = *__error();
        goto LABEL_42;
      }
    }
    if (v37 < v27)
    {
      sub_206324734(CFSTR("%s:%d: %s: resource fork is too small (actual size: %llu < expected min size: %llu) header: (attr_size %u, compression_type %u, uncompressed_size %llu)\n"), v30, v31, v32, v33, v34, v35, v36, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
LABEL_25:
      v25 = 22;
      goto LABEL_26;
    }
    if (HIDWORD(v84) == 0x20000)
    {
      if ((sub_2063291B4(&v83, __b, 0x32uLL, v37 - 50, (int *)&v86, v34, v35, v36) & 1) != 0)
      {
        if (memcmp(__b, &unk_20632ADC8, 0x32uLL))
        {
          sub_206324734(CFSTR("%s:%d: %s: invalid resource map\n"), v61, v62, v63, v64, v65, v66, v67, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
          goto LABEL_25;
        }
        LODWORD(value) = -1431655766;
        if ((sub_2063291B4(&v83, &value, 4uLL, 260, (int *)&v86, v65, v66, v67) & 1) != 0)
        {
          if ((_DWORD)value == v85)
            goto LABEL_5;
          sub_206324734(CFSTR("%s:%d: %s: expected chunk count %u, found %u\n"), v75, v76, v77, v78, v79, v80, v81, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
          goto LABEL_37;
        }
      }
    }
    else
    {
      LODWORD(value) = -1431655766;
      if ((sub_2063291B4(&v83, &value, 4uLL, 4 * v85, (int *)&v86, v34, v35, v36) & 1) != 0)
      {
        if (v37 == value)
          goto LABEL_5;
        sub_206324734(CFSTR("%s:%d: %s: expected size %u, found %llu\n"), v68, v69, v70, v71, v72, v73, v74, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
LABEL_37:
        v25 = 22;
        goto LABEL_42;
      }
    }
    v25 = v86;
LABEL_42:
    if ((_DWORD)v25)
      goto LABEL_26;
    goto LABEL_5;
  }
  return 93;
}

uint64_t sub_206323D48(uint64_t a1, const void *a2, size_t a3)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (write(1, a2, a3) == a3)
    return 0;
  v4 = __error();
  strerror(*v4);
  sub_206324734(CFSTR("%s:%d: write: %s\n"), v5, v6, v7, v8, v9, v10, v11, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
  return *__error();
}

uint64_t decompressFile(char *a1, int a2, int a3)
{
  timespec v6;
  CFDataRef v7;
  int v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int *v45;
  CFDataRef v46;
  CFDataRef v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  CFDataRef v55;
  _QWORD v57[10];
  int v58;
  _QWORD v59[5];
  stat v60;
  char v61;
  timeval v62;
  __darwin_time_t tv_sec;
  int v64;
  int v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v61 = 0;
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v60.st_blksize = v6;
  *(timespec *)v60.st_qspare = v6;
  v60.st_birthtimespec = v6;
  *(timespec *)&v60.st_size = v6;
  v60.st_mtimespec = v6;
  v60.st_ctimespec = v6;
  *(timespec *)&v60.st_uid = v6;
  v60.st_atimespec = v6;
  *(timespec *)&v60.st_dev = v6;
  if (stat(a1, &v60) == -1)
  {
    v8 = *__error();
    v17 = __error();
    strerror(*v17);
    sub_206324734(CFSTR("%s:%d: stat %s: %s\n"), v18, v19, v20, v21, v22, v23, v24, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
    goto LABEL_33;
  }
  if ((v60.st_flags & 0x20) == 0)
    return 0;
  if (!a2)
  {
    v7 = 0;
    if (a3)
      goto LABEL_5;
LABEL_10:
    v57[0] = MEMORY[0x24BDAC760];
    v57[1] = 0x40000000;
    v57[2] = sub_2063243CC;
    v57[3] = &unk_24BEFF1B0;
    v57[4] = a1;
    v25 = sub_2063248B8(-1, a1, (uint64_t)a1, &v61, (uint64_t)v57);
    if (v25 != -1)
    {
      v26 = v25;
      v8 = 0;
      goto LABEL_12;
    }
    v8 = *__error();
    v37 = __error();
    strerror(*v37);
LABEL_21:
    sub_206324734(CFSTR("%s:%d: open %s: %s\n"), v38, v39, v40, v41, v42, v43, v44, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
LABEL_22:
    if (!v7)
      goto LABEL_27;
    goto LABEL_23;
  }
  v7 = sub_2063241CC();
  if (!a3)
    goto LABEL_10;
LABEL_5:
  if (!a1 || sub_2063249D4(a1, -1, 1))
  {
    v8 = *__error();
    v9 = __error();
    strerror(*v9);
    sub_206324734(CFSTR("%s:%d: unsetBsdflags %s: %s\n"), v10, v11, v12, v13, v14, v15, v16, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
    goto LABEL_22;
  }
  v27 = MEMORY[0x24BDAC760];
  v59[0] = MEMORY[0x24BDAC760];
  v59[1] = 0x40000000;
  v59[2] = sub_206324348;
  v59[3] = &unk_24BEFF170;
  v59[4] = a1;
  v28 = sub_2063248B8(-1, a1, (uint64_t)a1, &v61, (uint64_t)v59);
  if (v28 == -1)
  {
    v8 = *__error();
    v45 = __error();
    strerror(*v45);
    goto LABEL_21;
  }
  v26 = v28;
  v57[5] = v27;
  v57[6] = 0x40000000;
  v57[7] = sub_206324354;
  v57[8] = &unk_24BEFF190;
  v58 = v28;
  v57[9] = a1;
  v29 = sub_2063238EC();
  v8 = v29;
  if (v29)
  {
    strerror(v29);
    sub_206324734(CFSTR("%s:%d: Error: processFileData %s: %s\n"), v30, v31, v32, v33, v34, v35, v36, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
    ftruncate(v26, 0);
    sub_2063249D4(a1, -1, 0);
  }
  else
  {
    fremovexattr(v26, "com.apple.decmpfs", 0);
    fremovexattr(v26, "com.apple.ResourceFork", 0);
  }
LABEL_12:
  fsync(v26);
  close(v26);
  v62.tv_sec = v60.st_atimespec.tv_sec;
  *(&v62.tv_usec + 1) = -1431655766;
  v62.tv_usec = SLODWORD(v60.st_atimespec.tv_nsec) / 1000;
  tv_sec = v60.st_mtimespec.tv_sec;
  v65 = -1431655766;
  v64 = SLODWORD(v60.st_mtimespec.tv_nsec) / 1000;
  if (v61)
    lchmod(a1, v60.st_mode);
  utimes(a1, &v62);
  if (!v7)
    goto LABEL_27;
LABEL_23:
  if (!v8)
  {
    v46 = sub_2063241CC();
    if (!v46)
    {
      CFRelease(v7);
      v8 = 5;
LABEL_34:
      *__error() = v8;
      return 0xFFFFFFFFLL;
    }
    v47 = v46;
    if (CFEqual(v7, v46))
    {
      v8 = 0;
    }
    else
    {
      sub_206324734(CFSTR("%s:%d: Error: decompressing %s changed its data!\n"), v48, v49, v50, v51, v52, v53, v54, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
      v8 = 5;
    }
    CFRelease(v7);
    v55 = v47;
    goto LABEL_32;
  }
LABEL_27:
  if (!v7)
    goto LABEL_33;
  v55 = v7;
LABEL_32:
  CFRelease(v55);
LABEL_33:
  if (v8)
    goto LABEL_34;
  return 0;
}

CFDataRef sub_2063241CC()
{
  const char *v0;
  int v1;
  __int128 v2;
  int v3;
  ssize_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFDataRef v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CC_SHA256_CTX c;
  unsigned __int8 __b[4096];
  unsigned __int8 md[16];
  __int128 v26;
  uint64_t v27;

  v0 = (const char *)MEMORY[0x24BDAC7A8]();
  v27 = *MEMORY[0x24BDAC8D0];
  v1 = open(v0, 0);
  *(_QWORD *)&c.wbuf[14] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&c.wbuf[6] = v2;
  *(_OWORD *)&c.wbuf[10] = v2;
  *(_OWORD *)&c.hash[6] = v2;
  *(_OWORD *)&c.wbuf[2] = v2;
  *(_OWORD *)c.count = v2;
  *(_OWORD *)&c.hash[2] = v2;
  *(_OWORD *)md = v2;
  v26 = v2;
  if (v1 == -1)
  {
    v5 = __error();
    strerror(*v5);
    sub_206324734(CFSTR("%s:%d: open %s: %s\n"), v6, v7, v8, v9, v10, v11, v12, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
    return 0;
  }
  else
  {
    v3 = v1;
    CC_SHA256_Init(&c);
    while (1)
    {
      memset(__b, 170, sizeof(__b));
      v4 = read(v3, __b, 0x1000uLL);
      if (!v4)
        break;
      if (v4 == -1)
      {
        v14 = __error();
        strerror(*v14);
        sub_206324734(CFSTR("%s:%d: read %s: %s\n"), v15, v16, v17, v18, v19, v20, v21, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
        v13 = 0;
        goto LABEL_9;
      }
      CC_SHA256_Update(&c, __b, v4);
    }
    CC_SHA256_Final(md, &c);
    v13 = CFDataCreate(0, md, 32);
LABEL_9:
    close(v3);
  }
  return v13;
}

uint64_t sub_206324348(uint64_t a1)
{
  return open(*(const char **)(a1 + 32), 258);
}

uint64_t sub_206324354(uint64_t a1, const void *a2, size_t a3)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (write(*(_DWORD *)(a1 + 40), a2, a3) == a3)
    return 0;
  v4 = __error();
  strerror(*v4);
  sub_206324734(CFSTR("%s:%d: write %s: %s\n"), v5, v6, v7, v8, v9, v10, v11, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
  return *__error();
}

uint64_t sub_2063243CC(uint64_t a1)
{
  return open(*(const char **)(a1 + 32), 258);
}

uint64_t sub_2063243D8(char *a1, int a2, uint64_t a3, int *a4)
{
  timespec v8;
  uint64_t result;
  off_t st_size;
  unsigned int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  ssize_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  int v40;
  int v41;
  stat v42;

  v8.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v8.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v42.st_blksize = v8;
  *(timespec *)v42.st_qspare = v8;
  v42.st_birthtimespec = v8;
  *(timespec *)&v42.st_size = v8;
  v42.st_mtimespec = v8;
  v42.st_ctimespec = v8;
  *(timespec *)&v42.st_uid = v8;
  v42.st_atimespec = v8;
  *(timespec *)&v42.st_dev = v8;
  if (a2 == -1)
    result = stat(a1, &v42);
  else
    result = fstat(a2, &v42);
  if ((_DWORD)result != -1)
  {
    if (a3)
    {
      st_size = v42.st_size;
      *(_QWORD *)a3 = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = st_size;
      *(_QWORD *)(a3 + 24) = 0;
    }
    else
    {
      *a4 = 0;
    }
    if ((v42.st_flags & 0x20) == 0)
      return 0;
    v11 = sub_2063235E8(a1, a2);
    if (v11)
    {
      v19 = v11;
      if (v11[1] == 1668116582)
      {
        v20 = v11[2];
        if (a4)
        {
          *a4 = v20;
        }
        else
        {
          *(_DWORD *)a3 = v20;
          v21 = *(_QWORD *)(v19 + 3);
          *(_QWORD *)(a3 + 16) = v21;
          if (v21 != v42.st_size)
          {
            sub_206324734(CFSTR("%s:%d: Error: Uncompressed size for path '%s' as reported by stat did not match size in disk header!\n"), v12, v13, v14, v15, v16, v17, v18, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
            v20 = *(_DWORD *)a3;
          }
          v41 = 0;
          sub_206328F60(v20, 0, &v41, v14, v15, v16, v17, v18);
          if (v41 == 196608 || v41 == 0x20000)
          {
            if (a2 == -1)
              v30 = getxattr(a1, "com.apple.ResourceFork", 0, 0, 0, 32);
            else
              v30 = fgetxattr(a2, "com.apple.ResourceFork", 0, 0, 0, 32);
            if (v30 == -1)
            {
              sub_206324734(CFSTR("%s:%d: Error: Type %d compressed file at path '%s' did not have a resource fork\n"), v31, v32, v33, v34, v35, v36, v37, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
              LODWORD(v38) = *v19;
            }
            else
            {
              v38 = *v19;
              *(_QWORD *)(a3 + 8) = v30 + v38;
              v39 = 2;
              if (v41 == 0x20000)
              {
                v39 = 3;
                v40 = 314;
              }
              else
              {
                v40 = 4;
              }
              *(_DWORD *)(a3 + 4) = v38
                                  + v40
                                  + (((unint64_t)(*(_QWORD *)(a3 + 16) + 0xFFFFLL) >> 16) << v39);
            }
            if (v38 >= 0x18)
              *(_QWORD *)(a3 + 24) = *(_QWORD *)(v19 + 5);
            goto LABEL_13;
          }
          if (v41 == 0x10000)
          {
            *(_QWORD *)(a3 + 8) = *v19;
            v29 = 16;
          }
          else
          {
            if (*(_DWORD *)a3 != 5)
            {
              sub_206324734(CFSTR("%s:%d: Error: Unknown compression scheme encountered for file '%s'\n"), v22, v23, v24, v25, v26, v27, v28, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
              goto LABEL_13;
            }
            *(_QWORD *)(a3 + 8) = -1;
            v29 = -1;
          }
          *(_DWORD *)(a3 + 4) = v29;
        }
LABEL_13:
        free(v19);
        return 0;
      }
      sub_206324734(CFSTR("%s:%d: Error: Compressed file at path '%s' had incorrect magic in disk header\n"), v12, v13, v14, v15, v16, v17, v18, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressData/CompressData.c");
      free(v19);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t queryCompressionType(char *a1, int *a2)
{
  if (a1 && a2)
    return sub_2063243D8(a1, -1, 0, a2);
  *__error() = 22;
  return 0xFFFFFFFFLL;
}

uint64_t fqueryCompressionInfo(int a1, uint64_t a2)
{
  if ((a1 & 0x80000000) == 0 && a2)
    return sub_2063243D8("fd", a1, a2, 0);
  *__error() = 22;
  return 0xFFFFFFFFLL;
}

uint64_t fqueryCompressionType(int a1, int *a2)
{
  if ((a1 & 0x80000000) == 0 && a2)
    return sub_2063243D8("fd", a1, 0, a2);
  *__error() = 22;
  return 0xFFFFFFFFLL;
}

int *sub_206324734(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  CFIndex Length;
  CFIndex v14;
  char *v15;
  const char *v16;
  size_t v17;
  int *result;

  v10 = *__error();
  if (qword_2544F1268 != -1)
    dispatch_once(&qword_2544F1268, &unk_24BEFF1F0);
  v11 = CFStringCreateWithFormatAndArguments(0, 0, a1, &a9);
  if (v11)
  {
    v12 = v11;
    Length = CFStringGetLength(v11);
    v14 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    v15 = (char *)malloc(v14);
    v16 = "failed to convert string\n";
    if (v15 && CFStringGetCString(v12, v15, v14, 0x8000100u))
      v16 = v15;
    CFRelease(v12);
  }
  else
  {
    v15 = 0;
    v16 = "failed to convert string\n";
  }
  if (!byte_2544F1260)
  {
    syslog(3, "%s", v16);
    if (!v15)
      goto LABEL_14;
    goto LABEL_13;
  }
  v17 = strlen(v16);
  if (v16[v17 - 1] != 10)
    *(_WORD *)&v16[v17] = 10;
  fputs(v16, (FILE *)*MEMORY[0x24BDAC8D8]);
  if (v15)
LABEL_13:
    free(v15);
LABEL_14:
  result = __error();
  *result = v10;
  return result;
}

uint64_t sub_206324890()
{
  uint64_t result;

  result = isatty(2);
  byte_2544F1260 = (_DWORD)result != 0;
  return result;
}

uint64_t sub_2063248B8(int a1, const char *a2, uint64_t a3, _BYTE *a4, uint64_t a5)
{
  uint64_t result;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  result = (*(uint64_t (**)(uint64_t))(a5 + 16))(a5);
  if ((_DWORD)result == -1)
  {
    if (*__error() == 13)
    {
      if (a2)
      {
        if (lchmod(a2, 0x180u) == -1)
        {
          v10 = __error();
          strerror(*v10);
          sub_206324734(CFSTR("%s:%d: lchmod %s (%s): %s\n"), v11, v12, v13, v14, v15, v16, v17, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/commonUtilsUser.c");
          return 0xFFFFFFFFLL;
        }
      }
      else if (fchmod(a1, 0x180u) == -1)
      {
        v18 = __error();
        strerror(*v18);
        sub_206324734(CFSTR("%s:%d: fchmod %s: %s\n"), v19, v20, v21, v22, v23, v24, v25, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/commonUtilsUser.c");
        return 0xFFFFFFFFLL;
      }
      *a4 = 1;
      return (*(uint64_t (**)(uint64_t))(a5 + 16))(a5);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_2063249D4(char *a1, int a2, int a3)
{
  timespec v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  stat v12;
  unint64_t v13;
  int v14;

  v13 = 0xAAAAAAAAAAAAAAAALL;
  v14 = -1431655766;
  v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v12.st_blksize = v5;
  *(timespec *)v12.st_qspare = v5;
  v12.st_birthtimespec = v5;
  *(timespec *)&v12.st_size = v5;
  v12.st_mtimespec = v5;
  v12.st_ctimespec = v5;
  *(timespec *)&v12.st_uid = v5;
  v12.st_atimespec = v5;
  v6 = 32 * (a3 == 0);
  v7 = 4;
  *(timespec *)&v12.st_dev = v5;
  while (a2 != -1)
  {
    if (fstat(a2, &v12))
      goto LABEL_16;
LABEL_6:
    LODWORD(v13) = v12.st_flags;
    HIDWORD(v13) = v12.st_flags & 0xFFFFFFDF | v6;
    v14 = -1;
    if (a2 == -1)
      v8 = fsctl(a1, 0xC00C4114uLL, &v13, 0);
    else
      v8 = ffsctl(a2, 0xC00C4114uLL, &v13, 0);
    v9 = v8;
    if ((_DWORD)v8)
    {
      if ((v8 & 0x80000000) != 0 && *__error() != 35)
        return v9;
    }
    else if (v12.st_flags == v14)
    {
      return 0;
    }
    if (!--v7)
      goto LABEL_17;
  }
  if (!stat(a1, &v12))
    goto LABEL_6;
LABEL_16:
  v9 = *__error();
LABEL_17:
  if (v12.st_flags == v14)
    v10 = 0;
  else
    v10 = 35;
  if (!(_DWORD)v9)
    return v10;
  return v9;
}

void *CreateStreamCompressorQueueWithOptions(const __CFDictionary *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const void *Value;
  const void *v22;
  CFTypeID v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CFTypeID v31;
  CFTypeRef v32;
  const __CFURL *v33;
  const __CFURL *v34;
  __CFBundle *v35;
  const __CFURL *v36;
  const __CFURL *v37;
  __CFReadStream *v38;
  __CFReadStream *v39;
  const __CFURL *v40;
  const __CFURL *v41;
  CFTypeID v42;
  _QWORD *v43;
  const __CFArray *v44;
  const __CFArray *v45;
  CFTypeID v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  CFIndex v54;
  CFIndex v55;
  CFIndex v56;
  const __CFNumber *ValueAtIndex;
  const __CFNumber *v58;
  CFTypeID v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const __CFArray *v71;
  const __CFArray *v72;
  CFTypeID v73;
  CFIndex Count;
  uint64_t v75;
  size_t v76;
  const void **v77;
  int v78;
  dispatch_queue_global_t global_queue;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const __CFNumber *v94;
  const __CFNumber *v95;
  CFTypeID v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  SInt32 IntValue;
  CFTypeID v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unsigned int v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  _BYTE v121[4];
  unsigned int valuePtr;
  uint64_t v123;
  CFRange v124;

  v123 = *MEMORY[0x24BDAC8D0];
  v2 = calloc(1uLL, 0x60uLL);
  *(_QWORD *)v2 = dispatch_group_create();
  *((_BYTE *)v2 + 13) = sub_206325298(a1, CFSTR("IgnoreXattrErrors"), 0, v3, v4, v5, v6, v7);
  *((_BYTE *)v2 + 14) = sub_206325298(a1, CFSTR("AllowStoringDataInXattr"), 1, v8, v9, v10, v11, v12);
  *((_DWORD *)v2 + 9) = sub_206325344(a1, CFSTR("CompressionLevel"), 5);
  v13 = sub_206325344(a1, CFSTR("MaxCompressionPercentage"), 80);
  *((_DWORD *)v2 + 5) = v13;
  if ((v13 - 101) <= 0xFFFFFF9B)
  {
    sub_206324734(CFSTR("%s:%d: Error: compression ratio needs to be between 1 and 100\n"), v14, v15, v16, v17, v18, v19, v20, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
    goto LABEL_50;
  }
  if (a1)
  {
    Value = CFDictionaryGetValue(a1, CFSTR("CompressionRules"));
    v22 = CFDictionaryGetValue(a1, CFSTR("SystemCompressionRules"));
    if (Value)
    {
      v23 = CFGetTypeID(Value);
      if (v23 != CFArrayGetTypeID())
        goto LABEL_49;
      Value = CFRetain(Value);
    }
    if (v22)
    {
      v31 = CFGetTypeID(v22);
      if (v31 == CFArrayGetTypeID())
      {
        v32 = CFRetain(v22);
        goto LABEL_27;
      }
LABEL_49:
      *((_QWORD *)v2 + 10) = 0;
      sub_206324734(CFSTR("%s:%d: Error: _InitCompressionRules failed (malformed plist?)\n"), v24, v25, v26, v27, v28, v29, v30, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
      goto LABEL_50;
    }
  }
  else
  {
    Value = 0;
  }
  v33 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)"/System/Library/PrivateFrameworks/AppleFSCompression.framework", 62, 1u);
  if (!v33)
    goto LABEL_49;
  v34 = v33;
  v35 = CFBundleCreate(0, v33);
  if (!v35 || (v36 = CFBundleCopyResourceURL(v35, CFSTR("SystemCompressionRules"), CFSTR("plist"), 0)) == 0)
  {
    v32 = 0;
    v41 = v34;
LABEL_25:
    CFRelease(v41);
    goto LABEL_26;
  }
  v37 = v36;
  v38 = CFReadStreamCreateWithFile(0, v36);
  v39 = v38;
  if (v38 && CFReadStreamOpen(v38))
  {
    v40 = (const __CFURL *)CFPropertyListCreateWithStream(0, v39, 0, 0, 0, 0);
    v41 = v40;
    if (v40 && (v42 = CFGetTypeID(v40), v42 == CFArrayGetTypeID()))
      v32 = CFRetain(v41);
    else
      v32 = 0;
  }
  else
  {
    v32 = 0;
    v41 = 0;
  }
  CFRelease(v34);
  CFRelease(v37);
  if (v39)
  {
    CFReadStreamClose(v39);
    CFRelease(v39);
  }
  if (v41)
    goto LABEL_25;
LABEL_26:
  if (!v32)
    goto LABEL_49;
LABEL_27:
  v43 = malloc(0x10uLL);
  if (!v43)
  {
    if (Value)
      CFRelease(Value);
    if (v32)
      CFRelease(v32);
    goto LABEL_49;
  }
  *v43 = Value;
  v43[1] = v32;
  *((_QWORD *)v2 + 10) = v43;
  *((_DWORD *)v2 + 16) = 0;
  if (!a1)
    goto LABEL_59;
  v44 = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("SkipMachOFileTypes"));
  if (!v44)
  {
LABEL_53:
    if (*((_DWORD *)v2 + 16))
    {
LABEL_54:
      v71 = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("SkipMachOOverridePaths"));
      if (v71)
      {
        v72 = v71;
        v73 = CFGetTypeID(v71);
        if (v73 == CFArrayGetTypeID())
        {
          Count = CFArrayGetCount(v72);
          v75 = MEMORY[0x24BDAC7A8]();
          v77 = (const void **)&v121[-((v76 + 15) & 0xFFFFFFFFFFFFFFF0)];
          if (v75)
            memset(&v121[-((v76 + 15) & 0xFFFFFFFFFFFFFFF0)], 170, v76);
          v124.location = 0;
          v124.length = Count;
          CFArrayGetValues(v72, v124, v77);
          *((_QWORD *)v2 + 9) = CFSetCreate(0, v77, Count, MEMORY[0x24BDBD6B8]);
        }
      }
    }
LABEL_59:
    if (sub_206325298(a1, CFSTR("AFSCThrottledIO"), 0, v26, v27, v28, v29, v30))
    {
      *((_QWORD *)v2 + 5) = dispatch_get_global_queue(-32768, 0);
    }
    else
    {
      v78 = sub_206325344(a1, CFSTR("DispatchQueuePriority"), 2);
      global_queue = dispatch_get_global_queue(v78, 0);
      *((_QWORD *)v2 + 5) = global_queue;
      if (!global_queue)
      {
        sub_206324734(CFSTR("%s:%d: Error: invalid kAFSCDispatchQueuePriority value %d\n"), v80, v81, v82, v83, v84, v85, v86, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
        goto LABEL_50;
      }
    }
    v87 = dispatch_queue_create("ioqueue", 0);
    *((_QWORD *)v2 + 6) = v87;
    dispatch_set_target_queue(v87, *((dispatch_queue_t *)v2 + 5));
    v88 = dispatch_queue_create("borrowed buffer queue", 0);
    *((_QWORD *)v2 + 7) = v88;
    dispatch_set_target_queue(v88, *((dispatch_queue_t *)v2 + 5));
    *((_DWORD *)v2 + 4) = 0;
    valuePtr = 0;
    if (!a1)
      goto LABEL_76;
    v94 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("CompressionTypes"));
    if (v94)
    {
      v95 = v94;
      v96 = CFGetTypeID(v94);
      if (v96 == CFNumberGetTypeID())
      {
        if (CFNumberGetValue(v95, kCFNumberIntType, &valuePtr))
        {
          IntValue = valuePtr;
          goto LABEL_70;
        }
        sub_206324734(CFSTR("%s:%d: Error: value %@ for %@ could not be parsed\n"), v97, v98, v99, v100, v101, v102, v103, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
      }
      else
      {
        v105 = CFGetTypeID(v95);
        if (v105 == CFStringGetTypeID())
        {
          IntValue = CFStringGetIntValue((CFStringRef)v95);
          valuePtr = IntValue;
LABEL_70:
          if (sub_206328F60(IntValue, (int *)v2 + 6, (_DWORD *)v2 + 7, v99, v100, v101, v102, v103))
          {
            v113 = valuePtr;
            if (*((_DWORD *)v2 + 7) != 0x10000)
            {
              *((_DWORD *)v2 + 4) = valuePtr;
              if (v113)
                goto LABEL_77;
              goto LABEL_76;
            }
            *((_DWORD *)v2 + 4) = valuePtr + 1;
            sub_206328F60(v113 + 1, (int *)v2 + 6, (_DWORD *)v2 + 7, v89, v90, v91, v92, v93);
            sub_206324734(CFSTR("%s:%d: Error: shouldn't use compressor type %d since it is a single chunk compressor, using %d instead\n"), v114, v115, v116, v117, v118, v119, v120, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
          }
          goto LABEL_75;
        }
        sub_206324734(CFSTR("%s:%d: Error: value for %@ is not a string or number\n"), v106, v107, v108, v109, v110, v111, v112, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
      }
    }
LABEL_75:
    if (*((_DWORD *)v2 + 4))
    {
LABEL_77:
      *((_BYTE *)v2 + 32) = *((_DWORD *)v2 + 6);
      *((_BYTE *)v2 + 88) = sub_206325298(a1, CFSTR("Synchronous"), 0, v89, v90, v91, v92, v93);
      return v2;
    }
LABEL_76:
    *((_DWORD *)v2 + 4) = 8;
    sub_206328F60(8, (int *)v2 + 6, (_DWORD *)v2 + 7, v89, v90, v91, v92, v93);
    goto LABEL_77;
  }
  v45 = v44;
  v46 = CFGetTypeID(v44);
  if (v46 != CFArrayGetTypeID())
  {
    sub_206324734(CFSTR("%s:%d: Error: SkipMachOFileTypes value is not an array\n"), v47, v48, v49, v50, v51, v52, v53, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
    goto LABEL_53;
  }
  v54 = CFArrayGetCount(v45);
  if (v54 < 1)
    goto LABEL_53;
  v55 = v54;
  v56 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v45, v56);
    if (!ValueAtIndex)
      goto LABEL_43;
    v58 = ValueAtIndex;
    valuePtr = 0;
    v59 = CFGetTypeID(ValueAtIndex);
    if (v59 != CFNumberGetTypeID())
      break;
    CFNumberGetValue(v58, kCFNumberSInt32Type, &valuePtr);
    v62 = valuePtr;
LABEL_40:
    if (v62 == -1)
    {
      *((_DWORD *)v2 + 16) = -1;
      goto LABEL_54;
    }
    if (v62 - 1 >= 0x1F)
    {
      sub_206324734(CFSTR("%s:%d: Error: invalid item '%@' at index %ld in SkipMachOFileTypes dictionary\n"), v60, v61, v26, v27, v28, v29, v30, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
      goto LABEL_50;
    }
    *((_DWORD *)v2 + 16) |= 1 << v62;
LABEL_43:
    if (v55 == ++v56)
      goto LABEL_53;
  }
  if (v59 == CFStringGetTypeID())
  {
    if (qword_2544F1278 != -1)
      dispatch_once(&qword_2544F1278, &unk_24BEFF230);
    v62 = CFDictionaryGetValue((CFDictionaryRef)qword_2544F1270, v58);
    valuePtr = v62;
    goto LABEL_40;
  }
  sub_206324734(CFSTR("%s:%d: Error: SkipMachOFileTypes value at index %lu is not a number or string\n"), v63, v64, v65, v66, v67, v68, v69, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
LABEL_50:
  FinishStreamCompressorQueue((uint64_t)v2);
  return 0;
}

uint64_t sub_206325298(const __CFDictionary *Value, void *key, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  v8 = a3;
  if (Value)
    Value = (const __CFDictionary *)CFDictionaryGetValue(Value, key);
  if (Value == (const __CFDictionary *)*MEMORY[0x24BDBD270])
    return 1;
  if (Value == (const __CFDictionary *)*MEMORY[0x24BDBD268])
    return 0;
  if (Value)
    sub_206324734(CFSTR("%s:%d: Error: value for %@ is not a BOOLean, using default value (%s)\n"), (uint64_t)key, a3, a4, a5, a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
  return v8;
}

uint64_t sub_206325344(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  const __CFNumber *Value;
  const __CFNumber *v5;
  CFTypeID v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int valuePtr;

  if (a1)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
    if (Value)
    {
      v5 = Value;
      v6 = CFGetTypeID(Value);
      if (v6 == CFNumberGetTypeID())
      {
        valuePtr = -1431655766;
        if (CFNumberGetValue(v5, kCFNumberIntType, &valuePtr))
          return valuePtr;
        else
          sub_206324734(CFSTR("%s:%d: Error: invalid %@ value %@, assuming %d\n"), v14, v15, v16, v17, v18, v19, v20, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
      }
      else
      {
        sub_206324734(CFSTR("%s:%d: Error: value for %@ is not a number, assuming %d\n"), v7, v8, v9, v10, v11, v12, v13, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
      }
    }
  }
  return a3;
}

uint64_t FinishStreamCompressorQueue(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  const void *v6;
  uint64_t v7;
  const void *v8;

  v2 = DrainStreamCompressorQueue(a1);
  v3 = *__error();
  if (a1)
  {
    if (*(_QWORD *)a1)
      dispatch_release(*(dispatch_object_t *)a1);
    v4 = *(NSObject **)(a1 + 48);
    if (v4)
      dispatch_release(v4);
    v5 = *(NSObject **)(a1 + 56);
    if (v5)
      dispatch_release(v5);
    v6 = *(const void **)(a1 + 72);
    if (v6)
      CFRelease(v6);
    v7 = *(_QWORD *)(a1 + 80);
    if (v7)
    {
      v8 = *(const void **)(v7 + 8);
      if (v8)
        CFRelease(v8);
      if (*(_QWORD *)v7)
        CFRelease(*(CFTypeRef *)v7);
      free((void *)v7);
    }
    free((void *)a1);
  }
  *__error() = v3;
  return v2;
}

uint64_t DrainStreamCompressorQueue(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  if (!a1)
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  dispatch_group_wait(*(dispatch_group_t *)a1, 0xFFFFFFFFFFFFFFFFLL);
  if (*(_DWORD *)(a1 + 8))
  {
    strerror(*(_DWORD *)(a1 + 8));
    sub_206324734(CFSTR("%s:%d: Error: returning errno %d (%s) from DrainStreamCompressorQueue\n"), v2, v3, v4, v5, v6, v7, v8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
    v9 = *(_DWORD *)(a1 + 8);
    *__error() = v9;
    *(_DWORD *)(a1 + 8) = 0;
    return 0xFFFFFFFFLL;
  }
  return 0;
}

void sub_206325540()
{
  qword_2544F1270 = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], 0);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_2544F1270, CFSTR("*"), (const void *)0xFFFFFFFFFFFFFFFFLL);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_2544F1270, CFSTR("MH_OBJECT"), (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_2544F1270, CFSTR("MH_EXECUTE"), (const void *)2);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_2544F1270, CFSTR("MH_FVMLIB"), (const void *)3);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_2544F1270, CFSTR("MH_CORE"), (const void *)4);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_2544F1270, CFSTR("MH_PRELOAD"), (const void *)5);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_2544F1270, CFSTR("MH_DYLIB"), (const void *)6);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_2544F1270, CFSTR("MH_DYLINKER"), (const void *)7);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_2544F1270, CFSTR("MH_BUNDLE"), (const void *)8);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_2544F1270, CFSTR("MH_DYLIB_STUB"), (const void *)9);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_2544F1270, CFSTR("MH_DSYM"), (const void *)0xA);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_2544F1270, CFSTR("MH_KEXT_BUNDLE"), (const void *)0xB);
}

void *CreateStreamCompressorQueue()
{
  return CreateStreamCompressorQueueWithOptions(0);
}

_BYTE *CreateCompressionQueue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  _BYTE *result;

  result = CreateStreamCompressorQueueWithOptions(a5);
  if (result)
    result[12] = 1;
  return result;
}

BOOL CompressFile(uint64_t a1, char *a2, char *a3)
{
  timespec v6;
  NSObject *v7;
  int v8;
  int v9;
  int v10;
  _BOOL8 v11;
  uint64_t StreamCompressor;
  uint64_t v13;
  int v14;
  void *v15;
  off_t v16;
  ssize_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  stat v63;

  if (qword_2544F12B8 != -1)
    dispatch_once(&qword_2544F12B8, &unk_24BEFF7E0);
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v63.st_blksize = v6;
  *(timespec *)v63.st_qspare = v6;
  v63.st_birthtimespec = v6;
  *(timespec *)&v63.st_size = v6;
  v63.st_mtimespec = v6;
  v63.st_ctimespec = v6;
  *(timespec *)&v63.st_uid = v6;
  v63.st_atimespec = v6;
  *(timespec *)&v63.st_dev = v6;
  v7 = qword_2544F12C0;
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_2544F12C0, 0xFFFFFFFFFFFFFFFFLL);
  v8 = open(a2, 2);
  if (v8 == -1)
  {
    v31 = __error();
    strerror(*v31);
    sub_206324734(CFSTR("%s:%d: open '%s': %s\n"), v32, v33, v34, v35, v36, v37, v38, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressionQueue/CompressionQueue.c");
    v11 = 0;
  }
  else
  {
    v9 = v8;
    v10 = fstat(v8, &v63);
    v11 = v10 != -1;
    if (v10 == -1)
    {
      v39 = __error();
      strerror(*v39);
      sub_206324734(CFSTR("%s:%d: open '%s': %s\n"), v40, v41, v42, v43, v44, v45, v46, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressionQueue/CompressionQueue.c");
    }
    else
    {
      StreamCompressor = CreateStreamCompressor(v9, a2, a3, a1, v63.st_size);
      if (StreamCompressor)
      {
        v13 = StreamCompressor;
        v14 = *(_DWORD *)(StreamCompressor + 244);
        v15 = malloc(0x10000uLL);
        v16 = 0;
        while (v16 < v63.st_size)
        {
          v17 = pread(v14, v15, 0x10000uLL, v16);
          if (!v17)
            break;
          if (v17 == -1)
          {
            v47 = __error();
            strerror(*v47);
            sub_206324734(CFSTR("%s:%d: pread(%s): %s\n"), v48, v49, v50, v51, v52, v53, v54, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressionQueue/CompressionQueue.c");
            break;
          }
          v16 += v17;
          if (WriteToStreamCompressor(v13, (uint64_t)v15, v17, v18, v19, v20, v21, v22) != v17)
          {
            if (*__error() != 28)
            {
              v23 = __error();
              strerror(*v23);
              sub_206324734(CFSTR("%s:%d: WriteToStreamCompressor(%s): %s\n"), v24, v25, v26, v27, v28, v29, v30, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressionQueue/CompressionQueue.c");
            }
            break;
          }
        }
        free(v15);
        CloseStreamCompressor(v13, v55, v56, v57, v58, v59, v60, v61);
      }
    }
    close(v9);
  }
  dispatch_semaphore_signal(v7);
  return v11;
}

int *FinishCompressionAndCleanUp(uint64_t a1)
{
  int *result;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = (int *)FinishStreamCompressorQueue(a1);
  if ((_DWORD)result)
  {
    v2 = __error();
    strerror(*v2);
    return sub_206324734(CFSTR("%s:%d: FinishStreamCompressorQueue: %s\n"), v3, v4, v5, v6, v7, v8, v9, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Libraries/CompressionQueue/CompressionQueue.c");
  }
  return result;
}

const char *sub_206325914(const char *a1, char *__s, _BYTE *a3)
{
  const char *v3;
  size_t v6;
  const char *v7;
  int v8;

  v3 = a1;
  *a3 = 0;
  if (a1)
  {
    if (__s)
    {
      if (*a1)
      {
        if (*__s)
        {
          v6 = strlen(__s);
          if (!strncmp(v3, __s, v6))
          {
            v7 = &v3[v6];
            if (v3[v6])
            {
              if (v3[v6] == 47)
              {
                do
                  v8 = *(unsigned __int8 *)++v7;
                while (v8 == 47);
              }
              else if (*(v7 - 1) != 47)
              {
                return v3;
              }
              v3 = v7 - 1;
              if (!strncmp(v7 - 1, "/./", 3uLL))
                v3 = v7 + 1;
              *a3 = 1;
            }
          }
        }
      }
    }
  }
  return v3;
}

BOOL sub_2063259D8(int a1, CFArrayRef theArray, int a3, _BYTE *a4, _QWORD *a5)
{
  CFIndex Count;
  CFIndex v8;
  BOOL v9;
  CFIndex v10;
  int v11;
  int v12;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v14;
  CFTypeID v15;
  const __CFString *Value;
  const void *v17;
  const void *v18;
  const void *v19;
  int v20;
  CFTypeID v21;
  CFTypeID v22;
  CFTypeID v23;
  const void *v24;
  const void *v25;
  unsigned int v26;
  const void *v27;
  CFTypeID v28;
  const char *v29;
  unsigned int v31;
  unsigned int v32;
  uint64_t v35;
  uint64_t valuePtr;

  Count = CFArrayGetCount(theArray);
  if (Count < 1)
    return 1;
  v8 = Count;
  v9 = 0;
  v10 = 0;
  if (a3)
    v11 = 0;
  else
    v11 = 2;
  if (a3)
    v12 = 3;
  else
    v12 = 1;
  v31 = v12;
  v32 = v11;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v10);
    if (!ValueAtIndex || (v14 = ValueAtIndex, v15 = CFGetTypeID(ValueAtIndex), v15 != CFDictionaryGetTypeID()))
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Rule at index %llu was not a dictionary\n");
      return v9;
    }
    Value = (const __CFString *)CFDictionaryGetValue(v14, CFSTR("RuleType"));
    v17 = CFDictionaryGetValue(v14, CFSTR("Flags"));
    v18 = CFDictionaryGetValue(v14, CFSTR("InverseFlags"));
    v19 = v18;
    v35 = 0;
    valuePtr = 0;
    if (!Value && !v17 && !v18)
    {
      v29 = "None of the keys 'RuleType', 'Flags', or 'InverseFlags' were found while evaluating compression rule at index %llu\n";
      goto LABEL_48;
    }
    v20 = *a4 != 0;
    if (!Value)
      goto LABEL_19;
    v21 = CFGetTypeID(Value);
    if (v21 != CFStringGetTypeID())
    {
      v29 = "Key 'RuleType' was not a string while evaluating compression rule at index %llu\n";
      goto LABEL_48;
    }
    if (CFStringCompare(Value, CFSTR("Exclude"), 0))
    {
      if (CFStringCompare(Value, CFSTR("Include"), 0))
      {
        v29 = "Invalid value found for key 'RuleType' while evaluating compression rule at index %llu\n";
        goto LABEL_48;
      }
      v20 = 1;
LABEL_19:
      if (!v17)
        goto LABEL_22;
      goto LABEL_20;
    }
    v20 = 0;
    if (!v17)
      goto LABEL_22;
LABEL_20:
    v22 = CFGetTypeID(v17);
    if (v22 != CFNumberGetTypeID() || !CFNumberGetValue((CFNumberRef)v17, kCFNumberSInt64Type, &valuePtr))
    {
      v29 = "Key 'Flags' was not a number while evaluating compression rule at index %llu\n";
      goto LABEL_48;
    }
LABEL_22:
    if (v19)
    {
      v23 = CFGetTypeID(v19);
      if (v23 != CFNumberGetTypeID() || !CFNumberGetValue((CFNumberRef)v19, kCFNumberSInt64Type, &v35))
      {
        v29 = "Key 'InverseFlags' was not a number while evaluating compression rule at index %llu\n";
        goto LABEL_48;
      }
    }
    if (*a4 != v20 || (valuePtr & ~*a5) != 0 || (v35 & *a5) != 0)
      break;
    v9 = ++v10 >= v8;
    if (v8 == v10)
      return v9;
  }
  v24 = CFDictionaryGetValue(v14, CFSTR("PathEndsWithString"));
  if (v24)
  {
    v25 = v24;
    v26 = 1u;
    goto LABEL_36;
  }
  v25 = CFDictionaryGetValue(v14, CFSTR("PathBeginsWithString"));
  v26 = v32;
  if (v25)
    goto LABEL_36;
  v27 = CFDictionaryGetValue(v14, CFSTR("PathContainsString"));
  if (v27)
  {
    v25 = v27;
    v26 = 2u;
    goto LABEL_36;
  }
  v25 = CFDictionaryGetValue(v14, CFSTR("PathExactlyEqualsString"));
  v26 = v31;
  if (v25)
  {
LABEL_36:
    v28 = CFGetTypeID(v25);
    if (v28 == CFStringGetTypeID())
      __asm { BR              X9 }
    v29 = "A path match key had a value that was not a string, while evaluating compression rule at index %llu\n";
  }
  else
  {
    v29 = "String to match against not found while evaluating compression rule at index %llu\n";
  }
LABEL_48:
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], v29, v10);
  return v9;
}

void sub_206325D8C(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  __CFArray *v16;
  __CFArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[6];
  unsigned int v26;
  _QWORD block[6];

  if (*(_BYTE *)(a1 + 321))
    sub_206325F84(a1, "scheduling %s task after finish", a3, a4, a5, a6, a7, a8, (char)off_24BEFF300[a2]);
  if (*(_DWORD *)(a1 + 168) != -208193560 || *(_DWORD *)(a1 + 236) != -208193560)
    sub_206325F84(a1, "magic numbers have been clobbered (0x%08x 0x%08x)", a3, a4, a5, a6, a7, a8, *(_DWORD *)(a1 + 168));
  v12 = a3;
  if (a3)
  {
    if (a2)
      goto LABEL_13;
  }
  else
  {
    v12 = *(NSObject **)(a1 + 8 * a2 + 176);
    if (a2)
      goto LABEL_13;
  }
  if (*(_BYTE *)(a1 + 232))
    sub_206325F84(a1, "scheduling %s task after compression finished", a3, a4, a5, a6, a7, a8, (char)"compression");
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 224));
LABEL_13:
  v13 = *(_QWORD *)(a1 + 160);
  v14 = *(NSObject **)(a1 + 216);
  v15 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 1107296256;
  v25[2] = sub_2063260B8;
  v25[3] = &unk_24BEFF328;
  v26 = a2;
  v25[4] = a4;
  v25[5] = a1;
  v16 = sub_206326184();
  v17 = v16;
  if (*(_BYTE *)(v13 + 88))
  {
    if (qword_2544F1288 != -1)
      dispatch_once(&qword_2544F1288, &unk_24BEFF708);
    pthread_setspecific(qword_2544F1290, v17);
    sub_2063260B8((uint64_t)v25, v18, v19, v20, v21, v22, v23, v24);
    if (qword_2544F1288 != -1)
      dispatch_once(&qword_2544F1288, &unk_24BEFF708);
    pthread_setspecific(qword_2544F1290, 0);
    CFRelease(v17);
  }
  else
  {
    block[0] = v15;
    block[1] = 1107296256;
    block[2] = sub_206326280;
    block[3] = &unk_24BEFF6B8;
    block[4] = v25;
    block[5] = v16;
    dispatch_group_async(v14, v12, block);
  }
}

void sub_206325F84(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFArray *v17;
  CFIndex Count;
  __CFString *Mutable;
  CFIndex i;
  const void *ValueAtIndex;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46[2];

  v46[0] = 0;
  v46[1] = &a9;
  vasprintf(v46, a2, &a9);
  v44 = a1;
  v45 = v46[0];
  v43 = 510;
  sub_206324734(CFSTR("%s:%d: Error: StreamCompressor %p %s. PLEASE FILE A BUG AGAINST AppleFSCompression/X"), v10, v11, v12, v13, v14, v15, v16, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  v17 = sub_206326184();
  Count = CFArrayGetCount(v17);
  Mutable = CFStringCreateMutable(0, 0);
  if (Count >= 1)
  {
    for (i = 0; i != Count; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v17, i);
      CFStringAppendFormat(Mutable, 0, CFSTR("%p "), ValueAtIndex, v43, v44, v45);
    }
  }
  CFRelease(v17);
  sub_206324734(CFSTR("%s:%d: Error: StreamCompressor %p stack: %@"), v22, v23, v24, v25, v26, v27, v28, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  dispatch_queue_get_label(0);
  sub_206324734(CFSTR("%s:%d: Error: StreamCompressor %p queue: %s"), v29, v30, v31, v32, v33, v34, v35, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  sub_206324734(CFSTR("%s:%d: Error: StreamCompressor %p path: %s"), v36, v37, v38, v39, v40, v41, v42, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  if (Mutable)
    CFRelease(Mutable);
  free(v46[0]);
  abort();
}

void sub_2063260B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(unsigned int *)(a1 + 48);
  if (*(_BYTE *)(v8 + 321))
    sub_206325F84(v8, "running %s task after finish", a3, a4, a5, a6, a7, a8, (char)off_24BEFF300[v9]);
  if (!(_DWORD)v9 && *(_BYTE *)(v8 + 232))
    sub_206325F84(v8, "running %s task after compression finished", a3, a4, a5, a6, a7, a8, (char)"compression");
  if (*(_DWORD *)(v8 + 168) != -208193560 || *(_DWORD *)(v8 + 236) != -208193560)
    sub_206325F84(v8, "magic numbers have been clobbered (0x%08x 0x%08x)", a3, a4, a5, a6, a7, a8, *(_DWORD *)(v8 + 168));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (!*(_DWORD *)(a1 + 48))
    dispatch_group_leave(*(dispatch_group_t *)(v8 + 224));
}

__CFArray *sub_206326184()
{
  const __CFArray *v0;
  CFMutableArrayRef MutableCopy;
  __CFArray *v2;
  int v3;
  uint64_t v4;
  const void **v5;
  const void *v6;
  void *__b[101];

  __b[100] = *(void **)MEMORY[0x24BDAC8D0];
  if (qword_2544F1288 != -1)
    dispatch_once(&qword_2544F1288, &unk_24BEFF708);
  v0 = (const __CFArray *)pthread_getspecific(qword_2544F1290);
  if (v0)
    MutableCopy = CFArrayCreateMutableCopy(0, 0, v0);
  else
    MutableCopy = CFArrayCreateMutable(0, 0, 0);
  v2 = MutableCopy;
  memset(__b, 170, 0x320uLL);
  v3 = backtrace(__b, 100);
  if (v3 >= 1)
  {
    v4 = v3;
    v5 = (const void **)__b;
    do
    {
      v6 = *v5++;
      CFArrayAppendValue(v2, v6);
      --v4;
    }
    while (v4);
  }
  CFArrayAppendValue(v2, 0);
  return v2;
}

void sub_206326280(uint64_t a1)
{
  if (qword_2544F1288 != -1)
    dispatch_once(&qword_2544F1288, &unk_24BEFF708);
  pthread_setspecific(qword_2544F1290, *(const void **)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (qword_2544F1288 != -1)
    dispatch_once(&qword_2544F1288, &unk_24BEFF708);
  pthread_setspecific(qword_2544F1290, 0);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void sub_20632631C(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 7);
}

void sub_20632632C(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 32), 7);
}

uint64_t sub_206326338()
{
  return pthread_key_create((pthread_key_t *)&qword_2544F1290, 0);
}

uint64_t sub_206326348(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *(*v6)(uint64_t);
  void *v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v5 = 0x40000000;
  v6 = sub_20632646C;
  v7 = &unk_24BEFF358;
  v8 = v1;
  return (*(uint64_t (**)(uint64_t))(v2 + 16))(v2);
}

uint64_t sub_2063263A4(uint64_t a1)
{
  uint64_t v2;
  size_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  void *v19;
  uint64_t v20;

  v2 = *(_QWORD *)(a1 + 40);
  dispatch_suspend(*(dispatch_object_t *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 56);
  v4 = malloc(v3);
  if (!v4)
    sub_206325F84(v2, "allocating buffer of size %zu failed", v5, v6, v7, v8, v9, v10, v3);
  v11 = v4;
  v12 = *(_QWORD *)(a1 + 32);
  v15 = MEMORY[0x24BDAC760];
  v16 = 0x40000000;
  v17 = sub_206326444;
  v18 = &unk_24BEFF3A8;
  v13 = *(_QWORD *)(a1 + 48);
  v19 = v11;
  v20 = v13;
  return (*(uint64_t (**)(void))(v12 + 16))();
}

void sub_206326444(uint64_t a1)
{
  free(*(void **)(a1 + 32));
  dispatch_resume(*(dispatch_object_t *)(a1 + 40));
}

void *sub_20632646C(uint64_t a1)
{
  return sub_206329F28(*(void **)(a1 + 32));
}

void sub_206326474(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 40);
  *(_BYTE *)(v1 + 232) = 1;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(v1 + 216));
}

void sub_2063264A8(uint64_t a1, NSObject *a2, NSObject *a3, uint64_t a4)
{
  __CFArray *v8;
  __CFArray *v9;
  _QWORD v10[6];

  v8 = sub_206326184();
  v9 = v8;
  if (*(_BYTE *)(a1 + 88))
  {
    if (qword_2544F1288 != -1)
      dispatch_once(&qword_2544F1288, &unk_24BEFF708);
    pthread_setspecific(qword_2544F1290, v9);
    (*(void (**)(uint64_t))(a4 + 16))(a4);
    if (qword_2544F1288 != -1)
      dispatch_once(&qword_2544F1288, &unk_24BEFF708);
    pthread_setspecific(qword_2544F1290, 0);
    CFRelease(v9);
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 1107296256;
    v10[2] = sub_2063265C8;
    v10[3] = &unk_24BEFF728;
    v10[4] = a4;
    v10[5] = v8;
    dispatch_group_notify(a2, a3, v10);
  }
}

void sub_2063265C8(uint64_t a1)
{
  if (qword_2544F1288 != -1)
    dispatch_once(&qword_2544F1288, &unk_24BEFF708);
  pthread_setspecific(qword_2544F1290, *(const void **)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (qword_2544F1288 != -1)
    dispatch_once(&qword_2544F1288, &unk_24BEFF708);
  pthread_setspecific(qword_2544F1290, 0);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

int *sub_206326664(int *result, unsigned int a2)
{
  uint64_t v2;
  unsigned int *v3;
  __int128 v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  const __CFString *v15;
  unsigned int *v16;
  int v17;
  __int128 v19;
  int *v20;
  void *v21[2];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v2 = *((_QWORD *)result + 20);
    if (*(_BYTE *)(v2 + 12))
    {
      v3 = (unsigned int *)(result + 60);
      while (!__ldxr(v3))
      {
        if (!__stxr(a2, v3))
        {
          *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v24 = v5;
          v25 = v5;
          v22 = v5;
          v23 = v5;
          *(_OWORD *)v21 = v5;
          backtrace(v21, 10);
          v6 = __error();
          strerror(*v6);
          v14 = "/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp";
          v15 = CFSTR("%s:%d: %p %p %p %p %p %p %p %p %p %p: Error: setting compressor error to %d (%s)\n");
          return sub_206324734(v15, v7, v8, v9, v10, v11, v12, v13, (char)v14);
        }
      }
    }
    else
    {
      v17 = *(_DWORD *)(v2 + 8);
      v16 = (unsigned int *)(v2 + 8);
      if (v17)
        return result;
      while (!__ldxr(v16))
      {
        if (!__stxr(a2, v16))
        {
          *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v24 = v19;
          v25 = v19;
          v22 = v19;
          v23 = v19;
          *(_OWORD *)v21 = v19;
          backtrace(v21, 10);
          v20 = __error();
          strerror(*v20);
          v14 = "/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c";
          v15 = CFSTR("%s:%d: %p %p %p %p %p %p %p %p %p %p: Error: setting queue error to %d (%s)\n");
          return sub_206324734(v15, v7, v8, v9, v10, v11, v12, v13, (char)v14);
        }
      }
    }
    __clrex();
  }
  return result;
}

void *sub_206326808(uint64_t a1)
{
  sub_2063274E8(*(int **)(a1 + 32), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 244), *(const void **)(a1 + 40), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 48));
  return sub_206329F28(*(void **)(a1 + 56));
}

void sub_20632683C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD v9[5];

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_2063274DC;
  v9[3] = &unk_24BEFF4C8;
  v8 = *(_QWORD *)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  sub_206325D8C(v8, 4u, 0, (uint64_t)v9, a5, a6, a7, a8);
}

void sub_20632689C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  const uint8_t *v9;
  unsigned int v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  size_t v30;
  int v31;
  uint8_t *v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  BOOL v36;
  _QWORD v37[5];
  unsigned int v38;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(const uint8_t **)(a1 + 40);
  v11 = *(unsigned int *)(a1 + 56);
  v10 = *(_DWORD *)(a1 + 60);
  v12 = *(uint8_t **)(a1 + 48);
  v13 = *(unsigned int *)(a1 + 64);
  v14 = *(_QWORD *)(v8 + 160);
  if (*(_BYTE *)(v14 + 12))
    v15 = (unsigned int *)(v8 + 240);
  else
    v15 = (unsigned int *)(v14 + 8);
  v16 = *v15;
  if ((_DWORD)v16)
  {
    sub_206326664(*(int **)(a1 + 32), v16);
    sub_206326A78(v8, 3, v17, v18, v19, v20, v21, v22);
    return;
  }
  if (*(_BYTE *)(v8 + 324))
    goto LABEL_7;
  v29 = *(_DWORD *)(v14 + 24);
  if (v29 <= 773)
  {
    if (v29 == 460)
    {
      v30 = 0;
      goto LABEL_22;
    }
    if (v29 == 767)
    {
      v31 = *(_DWORD *)(v14 + 36);
      *(_WORD *)v12 = 24184;
      v32 = v12 + 2;
      LODWORD(v13) = v13 - 2;
      v33 = v31 - 1;
      v34 = v31 + 512;
      if (v33 >= 9)
        v30 = 517;
      else
        v30 = v34;
      goto LABEL_23;
    }
    goto LABEL_31;
  }
  if (v29 == 774)
  {
    v30 = 2304;
    goto LABEL_22;
  }
  if (v29 == 1535)
  {
    v30 = 1794;
    goto LABEL_22;
  }
  if (v29 != 1279)
  {
LABEL_31:
    sub_206324734(CFSTR("%s:%d: Error: unknown compression scheme %llu\n"), v16, a3, a4, v13, a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
    goto LABEL_7;
  }
  v30 = 2049;
LABEL_22:
  v32 = v12;
LABEL_23:
  v35 = sub_20632902C(v30, v9, v10, v32, v13, 1);
  if (v35)
    v36 = v29 == 767;
  else
    v36 = 0;
  if (v36)
    v23 = v35 + 2;
  else
    v23 = v35;
  if (v23)
  {
    *(_QWORD *)(*(_QWORD *)(v8 + 400) + 8 * v11) = v12;
    v24 = (uint8_t *)(v9 - 1);
    goto LABEL_8;
  }
LABEL_7:
  v23 = v10 + 1;
  *(_QWORD *)(*(_QWORD *)(v8 + 400) + 8 * v11) = v9 - 1;
  v24 = v12;
LABEL_8:
  sub_206329F28(v24);
  *(_DWORD *)(*(_QWORD *)(v8 + 408) + 4 * v11) = v23;
  dispatch_group_enter(*(dispatch_group_t *)(v8 + 224));
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 0x40000000;
  v37[2] = sub_206326B00;
  v37[3] = &unk_24BEFF678;
  v37[4] = v8;
  v38 = v23;
  sub_206325D8C(v8, 1u, 0, (uint64_t)v37, v25, v26, v27, v28);
}

void sub_206326A78(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD v8[5];
  int v9;
  _QWORD v10[6];

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 0x40000000;
  v8[2] = sub_2063274CC;
  v8[3] = &unk_24BEFF548;
  v8[4] = a1;
  v9 = a2;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_20632683C;
  v10[3] = &unk_24BEFF4F8;
  v10[4] = v8;
  v10[5] = a1;
  sub_206325D8C(a1, 3u, 0, (uint64_t)v10, a5, a6, a7, a8);
}

void sub_206326B00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unsigned int v9;
  int v10;
  int v11;
  uint64_t v12;
  unsigned int *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  unsigned int v18;
  int v19;
  _DWORD *v20;
  uint64_t v21;
  int *v22;
  _DWORD *v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD v29[5];
  int v30;
  _QWORD v31[6];

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_DWORD *)(v8 + 300) + *(_DWORD *)(a1 + 40);
  *(_DWORD *)(v8 + 300) = v9;
  v10 = *(_DWORD *)(v8 + 292);
  v11 = v10 + 1;
  *(_DWORD *)(v8 + 292) = v10 + 1;
  if (v9 > *(_DWORD *)(v8 + 296))
  {
    if (!*(_BYTE *)(v8 + 324))
      *(_BYTE *)(v8 + 324) = 1;
    goto LABEL_29;
  }
  if (v11 != *(_DWORD *)(v8 + 288))
    goto LABEL_29;
  v12 = *(_QWORD *)(v8 + 160);
  if (*(_BYTE *)(v12 + 12))
    v13 = (unsigned int *)(v8 + 240);
  else
    v13 = (unsigned int *)(v12 + 8);
  if (*v13)
  {
    sub_206326664((int *)v8, *v13);
    v14 = v8;
    v15 = 3;
LABEL_10:
    sub_206326A78(v14, v15, a3, a4, a5, a6, a7, a8);
    goto LABEL_29;
  }
  if (!v10 && v9 <= 0xECA && !*(_QWORD *)(v8 + 280) && *(_BYTE *)(v12 + 14) && !*(_BYTE *)(v8 + 248))
  {
    v14 = v8;
    v15 = 2;
    goto LABEL_10;
  }
  v16 = *(_QWORD *)(v8 + 336);
  if (v16)
  {
    v17 = (8 * v11) | 4;
    v18 = v9 + v17;
    v19 = v9 + v17 + 314;
    *(_DWORD *)v16 = 0x10000;
    *(int8x8_t *)(v16 + 4) = vrev32_s8((int8x8_t)vadd_s32(vdup_n_s32(v18), (int32x2_t)0x400000104));
    *(_DWORD *)(v16 + 12) = 838860800;
    *(_OWORD *)(v16 + 16) = 0u;
    *(_OWORD *)(v16 + 32) = 0u;
    *(_OWORD *)(v16 + 48) = 0u;
    *(_OWORD *)(v16 + 64) = 0u;
    *(_OWORD *)(v16 + 80) = 0u;
    *(_OWORD *)(v16 + 96) = 0u;
    *(_OWORD *)(v16 + 112) = 0u;
    *(_OWORD *)(v16 + 128) = 0u;
    *(_OWORD *)(v16 + 144) = 0u;
    *(_OWORD *)(v16 + 160) = 0u;
    *(_OWORD *)(v16 + 176) = 0u;
    *(_OWORD *)(v16 + 192) = 0u;
    *(_OWORD *)(v16 + 208) = 0u;
    *(_OWORD *)(v16 + 224) = 0u;
    *(_OWORD *)(v16 + 240) = 0u;
    v20 = *(_DWORD **)(v8 + 336);
    v20[64] = bswap32(v18);
    v21 = *(unsigned int *)(v8 + 288);
    v20[65] = v21;
    if ((_DWORD)v21)
    {
      v22 = *(int **)(v8 + 408);
      v23 = v20 + 67;
      do
      {
        v24 = *v22++;
        *(v23 - 1) = v17;
        *v23 = v24;
        v17 += v24;
        v23 += 2;
        --v21;
      }
      while (v21);
    }
  }
  else
  {
    v19 = *(_DWORD *)(v8 + 344);
    v25 = *(_QWORD *)(v8 + 352);
    if (v11)
    {
      v26 = 0;
      v27 = *(_QWORD *)(v8 + 408);
      do
      {
        *(_DWORD *)(v25 + 4 * v26) = v19;
        v19 += *(_DWORD *)(v27 + 4 * v26++);
        v28 = *(unsigned int *)(v8 + 288);
      }
      while (v26 < v28);
    }
    else
    {
      v28 = 0;
    }
    *(_DWORD *)(v25 + 4 * v28) = v19;
  }
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 0x40000000;
  v29[2] = sub_206326D28;
  v29[3] = &unk_24BEFF698;
  v29[4] = v8;
  v30 = v19;
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 1107296256;
  v31[2] = sub_20632683C;
  v31[3] = &unk_24BEFF4F8;
  v31[4] = v29;
  v31[5] = v8;
  sub_206325D8C(v8, 3u, 0, (uint64_t)v31, a5, a6, a7, a8);
LABEL_29:
  dispatch_group_leave(*(dispatch_group_t *)(v8 + 224));
}

ssize_t sub_206326D28(uint64_t a1)
{
  uint64_t v1;
  ssize_t result;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;
  unsigned int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;

  v1 = *(_QWORD *)(a1 + 32);
  result = fgetxattr(*(_DWORD *)(v1 + 244), "com.apple.ResourceFork", 0, 0, 0, 32);
  if (result == -1)
  {
    if (*__error() != 93)
    {
      v3 = __error();
      strerror(*v3);
      sub_206324734(CFSTR("%s:%d: fgetxattr %s: %s\n"), v4, v5, v6, v7, v8, v9, v10, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    }
  }
  else if (result >= 1)
  {
    *(_BYTE *)(v1 + 324) = 1;
    return result;
  }
  v11 = *(_QWORD *)(v1 + 336);
  if (v11)
  {
    result = sub_206326EBC(v1, *(_QWORD *)(v1 + 336), *(unsigned int *)(v1 + 332), 0);
    if ((result & 1) == 0)
      return result;
    v12 = (void **)(v1 + 336);
    v13 = (unsigned int *)(v1 + 332);
  }
  else
  {
    result = sub_206326EBC(v1, *(_QWORD *)(v1 + 352), *(unsigned int *)(v1 + 344), 0);
    if (!(_DWORD)result)
      return result;
    v12 = (void **)(v1 + 352);
    v13 = (unsigned int *)(v1 + 344);
  }
  v14 = *v13;
  sub_206329F28(*v12);
  *v12 = 0;
  if (*(_DWORD *)(v1 + 288))
  {
    v21 = 0;
    while (1)
    {
      result = sub_206326EBC(v1, *(_QWORD *)(*(_QWORD *)(v1 + 400) + 8 * v21), *(unsigned int *)(*(_QWORD *)(v1 + 408) + 4 * v21), v14);
      if (!(_DWORD)result)
        break;
      v14 += *(unsigned int *)(*(_QWORD *)(v1 + 408) + 4 * v21);
      sub_206329F28(*(void **)(*(_QWORD *)(v1 + 400) + 8 * v21));
      *(_QWORD *)(*(_QWORD *)(v1 + 400) + 8 * v21++) = 0;
      if (v21 >= *(unsigned int *)(v1 + 288))
        goto LABEL_15;
    }
  }
  else
  {
LABEL_15:
    if (!v11)
      return sub_206326FCC(v1, 1, v15, v16, v17, v18, v19, v20);
    result = sub_206326EBC(v1, (uint64_t)&unk_20632ADC8, 50, v14);
    if ((_DWORD)result)
      return sub_206326FCC(v1, 1, v15, v16, v17, v18, v19, v20);
  }
  return result;
}

uint64_t sub_206326EBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[8];

  if (a4 < 0x100000000)
  {
    v15 = *(_DWORD *)(a1 + 244);
    v16 = *(_QWORD *)(a1 + 8);
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 0x40000000;
    v26[2] = sub_2063274A8;
    v26[3] = &unk_24BEFF588;
    v26[4] = a1;
    v26[5] = a2;
    v26[6] = a3;
    v26[7] = a4;
    if (sub_2063248B8(v15, 0, v16, (_BYTE *)(a1 + 323), (uint64_t)v26) != -1)
      return 1;
    v18 = __error();
    strerror(*v18);
    sub_206324734(CFSTR("%s:%d: fsetxattr %s: %s\n"), v19, v20, v21, v22, v23, v24, v25, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    v14 = *__error();
    v13 = (int *)a1;
  }
  else
  {
    v5 = __error();
    strerror(*v5);
    sub_206324734(CFSTR("%s:%d: fileOffset=%llu is too big: %s\n"), v6, v7, v8, v9, v10, v11, v12, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    v13 = (int *)a1;
    v14 = 22;
  }
  sub_206326664(v13, v14);
  return 0;
}

intptr_t sub_206326FCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  intptr_t result;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  __darwin_time_t v13;
  CFDataRef v14;
  int v15;
  int v16;
  int v17;
  _QWORD *v18;
  uint64_t v19;
  size_t v20;
  void *v21;
  uint64_t v22;
  int v23;
  int v24;
  int *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[3];
  timeval bytes;
  uint64_t (*v69)(uint64_t);
  void *v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  result = *(unsigned int *)(a1 + 244);
  if ((_DWORD)result == -1)
    return result;
  v10 = *(_QWORD *)(a1 + 160);
  if (*(_BYTE *)(v10 + 12))
    v11 = (unsigned int *)(a1 + 240);
  else
    v11 = (unsigned int *)(v10 + 8);
  v12 = *v11;
  if (*v11)
    goto LABEL_6;
  v16 = *(_DWORD *)(v10 + 16);
  memset(v67, 170, sizeof(v67));
  switch((_DWORD)a2)
  {
    case 3:
      goto LABEL_34;
    case 2:
      if (!*(_BYTE *)(v10 + 14))
      {
        sub_206324734(CFSTR("%s:%d: Error: storing data in xattr not allowed\n"), a2, a3, a4, a5, a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
        v12 = 45;
        goto LABEL_6;
      }
      v20 = **(unsigned int **)(a1 + 408);
      v19 = v20 + 16;
      v18 = malloc(v20 + 16);
      v21 = **(void ***)(a1 + 400);
      memcpy(v18 + 2, v21, v20);
      sub_206329F28(v21);
      **(_QWORD **)(a1 + 400) = 0;
      v16 = *(_DWORD *)(*(_QWORD *)(a1 + 160) + 16) - 1;
      LODWORD(result) = *(_DWORD *)(a1 + 244);
      v17 = 1;
      break;
    case 1:
      v17 = 0;
      if (*(_QWORD *)(a1 + 280))
      {
        v67[2] = *(_QWORD *)(a1 + 280);
        v18 = v67;
        v19 = 24;
      }
      else
      {
        v18 = v67;
        v19 = 16;
      }
      break;
    default:
      sub_206324734(CFSTR("%s:%d: Error: invalid close flag %d\n"), a2, a3, a4, a5, a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
      v12 = 22;
      goto LABEL_6;
  }
  *(_DWORD *)v18 = 1668116582;
  *((_DWORD *)v18 + 1) = v16;
  v18[1] = *(_QWORD *)(a1 + 264);
  v22 = *(_QWORD *)(a1 + 8);
  bytes.tv_sec = MEMORY[0x24BDAC760];
  *(_QWORD *)&bytes.tv_usec = 0x40000000;
  v69 = sub_206327484;
  v70 = &unk_24BEFF568;
  v71 = a1;
  v72 = v18;
  v73 = v19;
  v23 = sub_2063248B8(result, 0, v22, (_BYTE *)(a1 + 323), (uint64_t)&bytes);
  v12 = *__error();
  if (v17)
    free(v18);
  if (v23 == -1)
  {
    v33 = __error();
    strerror(*v33);
    sub_206324734(CFSTR("%s:%d: fsetxattr %s: %s\n"), v34, v35, v36, v37, v38, v39, v40, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  }
  else if (*(_BYTE *)(*(_QWORD *)(a1 + 160) + 12) && ftruncate(*(_DWORD *)(a1 + 244), 0) == -1)
  {
    v12 = *__error();
    v41 = __error();
    strerror(*v41);
    sub_206324734(CFSTR("%s:%d: ftruncate %s: %s\n"), v42, v43, v44, v45, v46, v47, v48, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  }
  else
  {
    v24 = *(_DWORD *)(a1 + 244);
    if (v24 != -1 && !sub_2063249D4(0, v24, 0))
      goto LABEL_34;
    v12 = *__error();
    v25 = __error();
    strerror(*v25);
    sub_206324734(CFSTR("%s:%d: setBsdflags %s: %s\n"), v26, v27, v28, v29, v30, v31, v32, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  }
  if (!v12)
  {
LABEL_34:
    fsync(*(_DWORD *)(a1 + 244));
    if (!*(_BYTE *)(a1 + 249) && !*(_BYTE *)(*(_QWORD *)(a1 + 160) + 12))
      goto LABEL_37;
    v49 = *(_QWORD *)(a1 + 56);
    bytes.tv_sec = *(_QWORD *)(a1 + 48);
    *(&bytes.tv_usec + 1) = -1431655766;
    bytes.tv_usec = (int)v49 / 1000;
    v50 = *(_QWORD *)(a1 + 72);
    v69 = *(uint64_t (**)(uint64_t))(a1 + 64);
    HIDWORD(v70) = -1431655766;
    LODWORD(v70) = (int)v50 / 1000;
    if (futimes(*(_DWORD *)(a1 + 244), &bytes) == -1)
    {
      v12 = *__error();
      v51 = __error();
      strerror(*v51);
      sub_206324734(CFSTR("%s:%d: futimes %s (fd %d): %s\n"), v52, v53, v54, v55, v56, v57, v58, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    }
    else
    {
LABEL_37:
      v12 = 0;
    }
    if (*(_BYTE *)(a1 + 323) && fchmod(*(_DWORD *)(a1 + 244), *(_WORD *)(a1 + 20)) == -1)
    {
      v12 = *__error();
      v59 = __error();
      strerror(*v59);
      sub_206324734(CFSTR("%s:%d: fchmod %s (fd %d): %s\n"), v60, v61, v62, v63, v64, v65, v66, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    }
    if (!v12)
      goto LABEL_7;
  }
LABEL_6:
  sub_206326664((int *)a1, v12);
LABEL_7:
  v13 = *(_QWORD *)(a1 + 24);
  LODWORD(bytes.tv_sec) = *(_DWORD *)(a1 + 16);
  *(__darwin_time_t *)((char *)&bytes.tv_sec + 4) = v13;
  v14 = CFDataCreate(0, (const UInt8 *)&bytes, 12);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2544F1298);
  CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_2544F12A0, v14);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2544F1298);
  CFRelease(v14);
  v15 = *(_DWORD *)(a1 + 244);
  if (v15 != -1)
    close(v15);
  *(_DWORD *)(a1 + 244) = -1;
  if (qword_2544F12B8 != -1)
    dispatch_once(&qword_2544F12B8, &unk_24BEFF7E0);
  return dispatch_semaphore_signal((dispatch_semaphore_t)qword_2544F12C0);
}

uint64_t sub_206327484(uint64_t a1)
{
  return fsetxattr(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 244), "com.apple.decmpfs", *(const void **)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0);
}

uint64_t sub_2063274A8(uint64_t a1)
{
  return fsetxattr(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 244), "com.apple.ResourceFork", *(const void **)(a1 + 40), *(_QWORD *)(a1 + 48), *(_DWORD *)(a1 + 56), 0);
}

intptr_t sub_2063274CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_206326FCC(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), a3, a4, a5, a6, a7, a8);
}

uint64_t sub_2063274DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

int *sub_2063274E8(int *a1, int a2, const void *a3, size_t a4, off_t a5)
{
  ssize_t v10;
  int *result;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  do
  {
    *__error() = 0;
    v10 = pwrite(a2, a3, a4, a5);
    result = __error();
  }
  while (*result == 35);
  if (v10 != a4)
  {
    if (v10 == -1)
      v12 = *__error();
    else
      v12 = 28;
    strerror(v12);
    sub_206324734(CFSTR("%s:%d: Error: failed to write %zu bytes to %s(%d) at %llu: %s\n"), v13, v14, v15, v16, v17, v18, v19, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    return sub_206326664(a1, v12);
  }
  return result;
}

_DWORD *sub_2063275D0(_DWORD *result)
{
  _DWORD *v1;
  unint64_t v2;
  unsigned int v3;
  _BYTE *v4;

  v1 = result;
  result[90] = 0;
  v2 = *((_QWORD *)result + 33) - *((_QWORD *)result + 34);
  if (!v2)
  {
    *((_QWORD *)result + 46) = 0;
    result[91] = 0;
LABEL_8:
    *((_BYTE *)v1 + 376) = 0;
    return result;
  }
  if (v2 >= 0x10000)
    v3 = 0x10000;
  else
    v3 = result[66] - result[68];
  v1[91] = v3;
  if (*((_BYTE *)v1 + 304))
  {
    result = sub_206329DA0(v3, 1);
    *((_QWORD *)v1 + 46) = result;
    goto LABEL_8;
  }
  v4 = sub_206329DA0(v3 + 1, 1);
  *v4 = *(_BYTE *)(*((_QWORD *)v1 + 20) + 32);
  *((_QWORD *)v1 + 46) = v4 + 1;
  *((_BYTE *)v1 + 376) = 1;
  LODWORD(v4) = v1[91];
  v1[98] = (_DWORD)v4;
  result = sub_206329DA0(v4, 1);
  *((_QWORD *)v1 + 48) = result;
  return result;
}

uint64_t sub_20632766C(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  _QWORD v5[4];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(v1 + 244);
  v3 = *(_QWORD *)(v1 + 264);
  v5[0] = 0x300000002;
  v5[1] = 0;
  v5[2] = v3;
  v5[3] = 0;
  return fcntl(v2, 42, v5);
}

unint64_t *sub_2063276B4(uint64_t a1, unint64_t *a2)
{
  unint64_t *result;
  unint64_t v3;

  result = a2;
  do
    v3 = __ldxr(a2);
  while (__stxr(v3 + 1, a2));
  return result;
}

void sub_2063276CC(uint64_t a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;

  do
  {
    v2 = __ldxr(a2);
    v3 = v2 - 1;
  }
  while (__stxr(v3, a2));
  if (!v3)
    sub_2063276EC((uint64_t)a2);
}

void sub_2063276EC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t i;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  char v19;

  if (qword_2544F12B0 != -1)
    dispatch_once(&qword_2544F12B0, &unk_24BEFF7A0);
  if (pthread_getspecific(qword_2544F12A8) != (void *)a1)
  {
    v18 = "incorrectly released";
    goto LABEL_38;
  }
  if (!*(_BYTE *)(a1 + 321))
  {
    v18 = "finalized before it was finished";
    goto LABEL_38;
  }
  if (!*(_BYTE *)(a1 + 322))
  {
    v18 = "finalized before it was closed";
LABEL_38:
    sub_206325F84(a1, v18, v3, v4, v5, v6, v7, v8, v19);
  }
  if (*(_DWORD *)(a1 + 244) != -1)
    sub_206324734(CFSTR("%s:%d: Error: freed StreamCompressor for %s without closing data fd\n"), v2, v3, v4, v5, v6, v7, v8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  if (*(_QWORD *)(a1 + 256))
    sub_206324734(CFSTR("%s:%d: Error: freed StreamCompressor for %s that is still locked\n"), v2, v3, v4, v5, v6, v7, v8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  if (*(_QWORD *)(a1 + 368))
  {
    sub_206324734(CFSTR("%s:%d: Error: freed StreamCompressor for %s that is still has a curBuffer\n"), v2, v3, v4, v5, v6, v7, v8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    v9 = *(char **)(a1 + 368);
    if (*(_BYTE *)(a1 + 376))
      --v9;
    sub_206329F28(v9);
  }
  if (*(_QWORD *)(a1 + 384))
  {
    sub_206324734(CFSTR("%s:%d: Error: freed StreamCompressor for %s that is still has a compressionBuffer\n"), v2, v3, v4, v5, v6, v7, v8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    sub_206329F28(*(void **)(a1 + 384));
  }
  sub_206329F28(*(void **)(a1 + 336));
  sub_206329F28(*(void **)(a1 + 352));
  v10 = *(void **)(a1 + 400);
  if (v10)
  {
    if (*(_DWORD *)(a1 + 288))
    {
      v11 = 0;
      do
        sub_206329F28(*(void **)(*(_QWORD *)(a1 + 400) + 8 * v11++));
      while (v11 < *(unsigned int *)(a1 + 288));
      v10 = *(void **)(a1 + 400);
    }
    free(v10);
  }
  v12 = *(void **)(a1 + 408);
  if (v12)
    free(v12);
  *(_QWORD *)(a1 + 408) = 0;
  v13 = *(void **)(a1 + 8);
  if (v13)
    free(v13);
  *(_QWORD *)(a1 + 8) = 0;
  for (i = 176; i != 216; i += 8)
  {
    v15 = *(NSObject **)(a1 + i);
    if (v15)
      dispatch_release(v15);
    *(_QWORD *)(a1 + i) = 0;
  }
  v16 = *(NSObject **)(a1 + 216);
  if (v16)
    dispatch_release(v16);
  *(_QWORD *)(a1 + 216) = 0;
  v17 = *(NSObject **)(a1 + 224);
  if (v17)
    dispatch_release(v17);
  free((void *)a1);
}

uint64_t sub_2063278E4()
{
  return pthread_key_create((pthread_key_t *)&qword_2544F12A8, 0);
}

uint64_t sub_2063278F4(uint64_t a1)
{
  return open(*(const char **)(a1 + 32), 2);
}

void sub_206327900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];

  v8 = *(_QWORD **)(a1 + 32);
  sub_20632796C((uint64_t)v8, a2, a3, a4, a5, a6, a7, a8);
  v9 = v8[20];
  v11 = v8[26];
  v10 = v8[27];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 0x40000000;
  v12[2] = sub_206327AF8;
  v12[3] = &unk_24BEFF488;
  v12[4] = v8;
  sub_2063264A8(v9, v10, v11, (uint64_t)v12);
}

void sub_20632796C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int *v9;
  uint64_t v11;
  void *v12;
  uint64_t *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t *v25;
  uint64_t v26;

  if (*(_BYTE *)(a1 + 324))
  {
    v9 = (unsigned int *)(a1 + 328);
    do
    {
      if (__ldxr(v9))
      {
        __clrex();
        return;
      }
    }
    while (__stxr(1u, v9));
    v11 = MEMORY[0x24BDAC760];
    if (*(_BYTE *)(*(_QWORD *)(a1 + 160) + 12))
    {
      v20 = MEMORY[0x24BDAC760];
      v12 = &unk_24BEFF5A8;
      v13 = &v20;
      v14 = sub_206327E04;
    }
    else
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 0x40000000;
      v19[2] = sub_206327B94;
      v19[3] = &unk_24BEFF5C8;
      v19[4] = a1;
      v21 = MEMORY[0x24BDAC760];
      v22 = 1107296256;
      v23 = sub_20632683C;
      v24 = &unk_24BEFF4F8;
      v25 = v19;
      v26 = a1;
      sub_206325D8C(a1, 3u, 0, (uint64_t)&v21, a5, a6, a7, a8);
      *(_BYTE *)(a1 + 304) = 1;
      if (*(_QWORD *)(a1 + 368))
      {
        *(_QWORD *)(a1 + 312) = *(_QWORD *)(a1 + 272) - *(unsigned int *)(a1 + 360);
        sub_206329F28(*(void **)(a1 + 384));
        *(_QWORD *)(a1 + 384) = 0;
        *(_DWORD *)(a1 + 392) = 0;
      }
      v18 = v11;
      v12 = &unk_24BEFF658;
      v13 = &v18;
      v14 = sub_206327BDC;
    }
    v13[1] = 0x40000000;
    v13[2] = (uint64_t)v14;
    v13[3] = (uint64_t)v12;
    v13[4] = a1;
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 216));
    v15 = *(_QWORD *)(a1 + 160);
    v16 = *(NSObject **)(a1 + 224);
    v17 = *(NSObject **)(a1 + 192);
    v21 = v11;
    v22 = 1107296256;
    v23 = sub_206326474;
    v24 = &unk_24BEFF3F8;
    v25 = v13;
    v26 = a1;
    sub_2063264A8(v15, v16, v17, (uint64_t)&v21);
  }
}

uint64_t sub_206327AF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  pthread_key_t v9;
  unint64_t v10;
  unint64_t v11;

  v8 = *(_QWORD *)(a1 + 32);
  sub_206326FCC(v8, 3, a3, a4, a5, a6, a7, a8);
  dispatch_group_leave(**(dispatch_group_t **)(v8 + 160));
  *(_BYTE *)(v8 + 321) = 1;
  if (qword_2544F12B0 != -1)
    dispatch_once(&qword_2544F12B0, &unk_24BEFF7A0);
  v9 = qword_2544F12A8;
  pthread_setspecific(qword_2544F12A8, (const void *)v8);
  do
  {
    v10 = __ldxr((unint64_t *)v8);
    v11 = v10 - 1;
  }
  while (__stxr(v11, (unint64_t *)v8));
  if (!v11)
    sub_2063276EC(v8);
  return pthread_setspecific(v9, 0);
}

uint64_t sub_206327B94(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  _QWORD v5[4];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(v1 + 244);
  v3 = *(_QWORD *)(v1 + 264);
  v5[0] = 0x300000002;
  v5[1] = 0;
  v5[2] = v3;
  v5[3] = 0;
  return fcntl(v2, 42, v5);
}

void sub_206327BDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  unsigned __int8 *v14;
  uint64_t v15;
  int v16;
  uint64_t *v17;
  uint64_t v18;
  unsigned int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[6];
  int v29;
  int v30;
  unsigned int v31;
  int v32;
  _QWORD v33[6];
  int v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[7];

  v8 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v8 + 292))
  {
    v9 = 0;
    v10 = 0;
    v11 = MEMORY[0x24BDAC760];
    do
    {
      v12 = *(_QWORD *)(v8 + 160);
      if (*(_BYTE *)(v12 + 12))
        v13 = (unsigned int *)(v8 + 240);
      else
        v13 = (unsigned int *)(v12 + 8);
      if (*v13)
      {
        sub_206326664((int *)v8, *v13);
        sub_206326A78(v8, 3, v22, v23, v24, v25, v26, v27);
        return;
      }
      v14 = *(unsigned __int8 **)(*(_QWORD *)(v8 + 400) + 8 * v9);
      if (*(_QWORD *)(v8 + 264) - (unint64_t)v10 >= 0x10000)
        v15 = 0x10000;
      else
        v15 = *(_QWORD *)(v8 + 264) - v10;
      v16 = *(_DWORD *)(*(_QWORD *)(v8 + 408) + 4 * v9);
      if (*v14 == *(unsigned __int8 *)(v12 + 32))
      {
        if (v16 != (_DWORD)v15 + 1)
          __assert_rtn("decompressIfNecessary_block_invoke_3", "StreamCompressor.cpp", 1403, "bufSz == uncmpSize + 1");
        v33[0] = v11;
        v33[1] = 0x40000000;
        v33[2] = sub_206327E74;
        v33[3] = &unk_24BEFF5E8;
        v33[4] = v8;
        v33[5] = v14;
        v34 = v15;
        v35 = v10;
        v36 = v11;
        v37 = 1107296256;
        v38 = sub_20632683C;
        v39 = &unk_24BEFF4F8;
        v40 = v33;
        v41 = v8;
        v17 = &v36;
        v18 = v8;
        v19 = 3;
      }
      else
      {
        v28[0] = v11;
        v28[1] = 0x40000000;
        v28[2] = sub_206327EAC;
        v28[3] = &unk_24BEFF638;
        v28[4] = v8;
        v28[5] = v14;
        v29 = v16;
        v30 = v15;
        v31 = v10;
        v32 = v9;
        v20 = sub_206329DA0(v15, 0);
        if (!v20)
        {
          v21 = *(_QWORD *)(*(_QWORD *)(v8 + 160) + 56);
          v36 = v11;
          v37 = 1107296256;
          v38 = sub_2063263A4;
          v39 = &unk_24BEFF3C8;
          v42 = v21;
          v43 = v15;
          v40 = v28;
          v41 = v8;
          v17 = &v36;
          v18 = v8;
          v19 = 2;
          goto LABEL_16;
        }
        v44[0] = v11;
        v44[1] = 1107296256;
        v44[2] = sub_206326348;
        v44[3] = &unk_24BEFF378;
        v44[4] = v28;
        v44[5] = v20;
        v17 = v44;
        v18 = v8;
        v19 = 2;
      }
      v21 = 0;
LABEL_16:
      sub_206325D8C(v18, v19, v21, (uint64_t)v17, a5, a6, a7, a8);
      *(_QWORD *)(*(_QWORD *)(v8 + 400) + 8 * v9) = 0;
      v10 += v15;
      ++v9;
    }
    while (v9 < *(unsigned int *)(v8 + 292));
  }
}

void *sub_206327E04(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  void *result;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v1 + 292))
  {
    v2 = 0;
    do
    {
      sub_206329F28(*(void **)(*(_QWORD *)(v1 + 400) + 8 * v2));
      *(_QWORD *)(*(_QWORD *)(v1 + 400) + 8 * v2++) = 0;
    }
    while (v2 < *(unsigned int *)(v1 + 292));
  }
  v3 = *(_QWORD *)(v1 + 368);
  if (v3)
  {
    sub_206329F28((void *)(v3 - 1));
    *(_QWORD *)(v1 + 368) = 0;
  }
  result = *(void **)(v1 + 384);
  if (result)
  {
    result = sub_206329F28(result);
    *(_QWORD *)(v1 + 384) = 0;
  }
  return result;
}

void *sub_206327E74(uint64_t a1)
{
  sub_2063274E8(*(int **)(a1 + 32), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 244), (const void *)(*(_QWORD *)(a1 + 40) + 1), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  return sub_206329F28(*(void **)(a1 + 40));
}

void sub_206327EAC(uint64_t a1, uint8_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  size_t v16;
  BOOL v17;
  _BOOL4 v18;
  unsigned int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  _QWORD v29[7];
  int v30;
  int v31;
  _QWORD v32[6];

  v12 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v13 = *(_DWORD *)(*(_QWORD *)(v12 + 160) + 24);
  v15 = *(_DWORD *)(a1 + 48);
  v14 = *(unsigned int *)(a1 + 52);
  if (v13 <= 773)
  {
    if (v13 == 460)
    {
      v16 = 0;
      goto LABEL_12;
    }
    if (v13 == 767)
    {
      v16 = 517;
      goto LABEL_12;
    }
LABEL_19:
    sub_206324734(CFSTR("%s:%d: Error: unknown compression scheme %llu\n"), (uint64_t)a2, a3, a4, v14, a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
    v20 = 0;
    goto LABEL_16;
  }
  if (v13 == 1535)
  {
    v16 = 1794;
    goto LABEL_12;
  }
  if (v13 == 1279)
  {
    v16 = 2049;
    goto LABEL_12;
  }
  if (v13 != 774)
    goto LABEL_19;
  v16 = 2304;
LABEL_12:
  v17 = v13 == 767;
  v18 = v13 == 767;
  if (v17)
    v19 = v15 - 2;
  else
    v19 = v15;
  v20 = sub_20632902C(v16, (const uint8_t *)(v11 + 2 * v18), v19, a2, v14, 2);
LABEL_16:
  sub_206329F28(*(void **)(a1 + 40));
  if (v20 == *(_DWORD *)(a1 + 52))
  {
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 1107296256;
    v29[2] = sub_206328078;
    v29[3] = &unk_24BEFF608;
    v29[5] = v12;
    v29[6] = a2;
    v28 = *(_DWORD *)(a1 + 56);
    v30 = v20;
    v31 = v28;
    v29[4] = a3;
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 1107296256;
    v32[2] = sub_20632683C;
    v32[3] = &unk_24BEFF4F8;
    v32[4] = v29;
    v32[5] = v12;
    sub_206325D8C(v12, 3u, 0, (uint64_t)v32, v24, v25, v26, v27);
  }
  else
  {
    sub_206324734(CFSTR("%s:%d: Error: chunk %d of %s decompressed to %u, expected %u\n"), v21, v22, v23, v24, v25, v26, v27, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    sub_206326664((int *)v12, 0x16u);
    (*(void (**)(uint64_t))(a3 + 16))(a3);
  }
}

uint64_t sub_206328078(uint64_t a1)
{
  sub_2063274E8(*(int **)(a1 + 40), *(_DWORD *)(*(_QWORD *)(a1 + 40) + 244), *(const void **)(a1 + 48), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t CreateStreamCompressor(int a1, char *a2, char *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  char *v11;
  const char *v12;
  CFArrayRef *v13;
  const char *v14;
  CFStringRef v15;
  CFStringRef v16;
  int f_bsize_low;
  char v18;
  FILE *v19;
  const char *v20;
  size_t v21;
  _DWORD *v22;
  uint64_t v23;
  const char *v24;
  CFStringRef v25;
  CFStringRef v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  int v41;
  unsigned int v42;
  int *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  int *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  int v85;
  int *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  NSObject *v101;
  NSObject *v102;
  uint64_t v104;
  CFDataRef v105;
  __CFDictionary *Mutable;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  size_t v112;
  int v113;
  unsigned int v114;
  int v115;
  unsigned int v116;
  unsigned int v117;
  unint64_t v118;
  uint64_t v119;
  _QWORD v120[5];
  _QWORD v121[5];
  statfs __b;
  uint64_t v123;

  v5 = 0;
  v123 = *MEMORY[0x24BDAC8D0];
  if (!a4 || !a5)
    return v5;
  v11 = rindex(a2, 47);
  if (v11)
    v12 = v11 + 1;
  else
    v12 = a2;
  if (!strncmp(v12, "._", 2uLL))
    return 0;
  v119 = 0;
  if ((unint64_t)(a5 - 536870913) < 0xFFFFFFFFE0004000)
    goto LABEL_18;
  v13 = *(CFArrayRef **)(a4 + 80);
  if (!v13)
    goto LABEL_18;
  LOBYTE(__b.f_bsize) = 0;
  v14 = sub_206325914(a2, a3, &__b);
  v15 = CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x24BDBD240], v14);
  v16 = v15;
  LOBYTE(v121[0]) = 1;
  v119 = 0;
  f_bsize_low = LOBYTE(__b.f_bsize);
  if (*v13 && !sub_2063259D8((int)v15, *v13, LOBYTE(__b.f_bsize) != 0, v121, &v119))
  {
    v19 = (FILE *)*MEMORY[0x24BDAC8D8];
    v20 = "Failed to apply user rules.\n";
    v21 = 28;
LABEL_16:
    fwrite(v20, v21, 1uLL, v19);
    if (v16)
      CFRelease(v16);
    goto LABEL_18;
  }
  if (!sub_2063259D8((int)v16, v13[1], f_bsize_low != 0, v121, &v119))
  {
    v19 = (FILE *)*MEMORY[0x24BDAC8D8];
    v20 = "Failed to apply system rules.\n";
    v21 = 30;
    goto LABEL_16;
  }
  CFRelease(v16);
  if (LOBYTE(v121[0]))
  {
    v18 = 0;
    goto LABEL_20;
  }
LABEL_18:
  if (*(_BYTE *)(a4 + 12))
    return 0;
  v18 = 1;
LABEL_20:
  v22 = calloc(1uLL, 0x1A8uLL);
  v5 = (uint64_t)v22;
  if (!v22)
    return v5;
  *(_QWORD *)v22 = 1;
  v23 = v119;
  v22[59] = -208193560;
  v22[42] = -208193560;
  v22[61] = -1;
  *((_BYTE *)v22 + 322) = 1;
  *((_QWORD *)v22 + 1) = strdup(a2);
  *(_QWORD *)(v5 + 264) = a5;
  *(_QWORD *)(v5 + 160) = a4;
  *(_BYTE *)(v5 + 304) = v18;
  *(_QWORD *)(v5 + 280) = v23;
  dispatch_group_enter(*(dispatch_group_t *)a4);
  if (!*(_DWORD *)(a4 + 64)
    || *(_QWORD *)(a4 + 72)
    && (v24 = sub_206325914(*(const char **)(v5 + 8), a3, &__b),
        (v25 = CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x24BDBD240], v24)) != 0)
    && (v26 = v25, v27 = CFSetContainsValue(*(CFSetRef *)(a4 + 72), v25), CFRelease(v26), v27))
  {
    *(_BYTE *)(v5 + 320) = 1;
  }
  v28 = *(NSObject **)(*(_QWORD *)(v5 + 160) + 40);
  v29 = MEMORY[0x24BDAC9C0];
  v30 = dispatch_queue_create(0, MEMORY[0x24BDAC9C0]);
  dispatch_set_target_queue(v30, v28);
  *(_QWORD *)(v5 + 176) = v30;
  v31 = *(NSObject **)(*(_QWORD *)(v5 + 160) + 40);
  v32 = dispatch_queue_create(0, 0);
  dispatch_set_target_queue(v32, v31);
  *(_QWORD *)(v5 + 184) = v32;
  v33 = *(NSObject **)(*(_QWORD *)(v5 + 160) + 40);
  v34 = dispatch_queue_create(0, v29);
  dispatch_set_target_queue(v34, v33);
  *(_QWORD *)(v5 + 192) = v34;
  v35 = *(NSObject **)(*(_QWORD *)(v5 + 160) + 40);
  v36 = dispatch_queue_create(0, 0);
  dispatch_set_target_queue(v36, v35);
  *(_QWORD *)(v5 + 200) = v36;
  v37 = *(NSObject **)(*(_QWORD *)(v5 + 160) + 48);
  v38 = dispatch_queue_create(0, 0);
  dispatch_set_target_queue(v38, v37);
  *(_QWORD *)(v5 + 208) = v38;
  *(_QWORD *)(v5 + 216) = dispatch_group_create();
  *(_QWORD *)(v5 + 224) = dispatch_group_create();
  if (fstat(a1, (stat *)(v5 + 16)) == -1)
  {
    v42 = *__error();
    v43 = __error();
    strerror(*v43);
    sub_206324734(CFSTR("%s:%d: fstat %s: %s\n"), v44, v45, v46, v47, v48, v49, v50, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    goto LABEL_50;
  }
  if (qword_2544F12B8 != -1)
    dispatch_once(&qword_2544F12B8, &unk_24BEFF7E0);
  v39 = qword_2544F12C0;
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_2544F12C0, 0xFFFFFFFFFFFFFFFFLL);
  if (write(a1, 0, 0))
  {
    if (*__error() == 9)
    {
      memset(&__b, 170, 0x400uLL);
      if (fcntl(a1, 50, &__b) == -1)
      {
        v42 = *__error();
        v68 = __error();
        strerror(*v68);
        sub_206324734(CFSTR("%s:%d: fcntl %s: %s\n"), v69, v70, v71, v72, v73, v74, v75, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
      }
      else
      {
        v40 = *(_QWORD *)(v5 + 8);
        v121[0] = MEMORY[0x24BDAC760];
        v121[1] = 0x40000000;
        v121[2] = sub_2063278F4;
        v121[3] = &unk_24BEFF528;
        v121[4] = &__b;
        v41 = sub_2063248B8(-1, (const char *)&__b, v40, (_BYTE *)(v5 + 323), (uint64_t)v121);
        *(_DWORD *)(v5 + 244) = v41;
        if (v41 == -1)
        {
          v42 = *__error();
          v76 = __error();
          strerror(*v76);
          sub_206324734(CFSTR("%s:%d: open %s (%s): %s\n"), v77, v78, v79, v80, v81, v82, v83, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
        }
        else
        {
          v42 = 0;
        }
      }
    }
    else
    {
      v42 = *__error();
      v60 = __error();
      strerror(*v60);
      sub_206324734(CFSTR("%s:%d: write %s: %s\n"), v61, v62, v63, v64, v65, v66, v67, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    }
  }
  else
  {
    v51 = dup(a1);
    *(_DWORD *)(v5 + 244) = v51;
    if (v51 != -1)
      goto LABEL_44;
    v42 = *__error();
    v52 = __error();
    strerror(*v52);
    sub_206324734(CFSTR("%s:%d: dup %s: %s\n"), v53, v54, v55, v56, v57, v58, v59, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  }
  if (v42)
  {
    v84 = *(_DWORD *)(v5 + 244);
    if (v84 != -1)
      close(v84);
    *(_DWORD *)(v5 + 244) = -1;
    dispatch_semaphore_signal(v39);
    goto LABEL_50;
  }
LABEL_44:
  *(_BYTE *)(v5 + 322) = 0;
  *(_BYTE *)(v5 + 248) = 0;
  v85 = *(_DWORD *)(v5 + 244);
  if (v85 == -1)
  {
    v42 = 22;
    goto LABEL_50;
  }
  memset(&__b, 170, sizeof(__b));
  if (fstatfs(v85, &__b) != -1)
  {
    if ((__b.f_flags & 0x80) != 0)
      *(_BYTE *)(v5 + 248) = 1;
    goto LABEL_53;
  }
  v42 = *__error();
  v86 = __error();
  strerror(*v86);
  sub_206324734(CFSTR("%s:%d: fstatfs %s: %s\n"), v87, v88, v89, v90, v91, v92, v93, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
  if (v42)
  {
LABEL_50:
    sub_206326664((int *)v5, v42);
    sub_206326A78(v5, 3, v94, v95, v96, v97, v98, v99);
    v100 = *(_QWORD *)(v5 + 160);
    v101 = *(NSObject **)(v5 + 216);
    v102 = *(NSObject **)(v5 + 192);
    *(_QWORD *)&__b.f_bsize = MEMORY[0x24BDAC760];
    __b.f_blocks = 0x40000000;
    __b.f_bfree = (uint64_t)sub_206327900;
    __b.f_bavail = (uint64_t)&unk_24BEFF4A8;
    __b.f_files = v5;
    sub_2063264A8(v100, v101, v102, (uint64_t)&__b);
    return 0;
  }
LABEL_53:
  v104 = *(_QWORD *)(v5 + 24);
  __b.f_bsize = *(_DWORD *)(v5 + 16);
  *(_QWORD *)&__b.f_iosize = v104;
  v105 = CFDataCreate(0, (const UInt8 *)&__b, 12);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2544F1298);
  Mutable = (__CFDictionary *)qword_2544F12A0;
  if (!qword_2544F12A0)
  {
    *(_OWORD *)&__b.f_bsize = xmmword_24BEFF758;
    *(_OWORD *)&__b.f_bfree = *(_OWORD *)&off_24BEFF768;
    __b.f_files = 0;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], (const CFDictionaryValueCallBacks *)&__b);
    qword_2544F12A0 = (uint64_t)Mutable;
  }
  CFDictionarySetValue(Mutable, v105, (const void *)v5);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2544F1298);
  CFRelease(v105);
  if (*(_BYTE *)(v5 + 304))
  {
    v120[0] = MEMORY[0x24BDAC760];
    v120[1] = 0x40000000;
    v120[2] = sub_20632766C;
    v120[3] = &unk_24BEFF468;
    v120[4] = v5;
    *(_QWORD *)&__b.f_bsize = MEMORY[0x24BDAC760];
    __b.f_blocks = 1107296256;
    __b.f_bfree = (uint64_t)sub_20632683C;
    __b.f_bavail = (uint64_t)&unk_24BEFF4F8;
    __b.f_files = (uint64_t)v120;
    __b.f_ffree = v5;
    sub_206325D8C(v5, 3u, 0, (uint64_t)&__b, v107, v108, v109, v110);
  }
  else
  {
    v111 = *(_QWORD *)(v5 + 264);
    v112 = ((unint64_t)v111 + 0xFFFF) >> 16;
    *(_DWORD *)(v5 + 288) = v112;
    *(_QWORD *)(v5 + 400) = calloc(v112, 8uLL);
    *(_QWORD *)(v5 + 408) = calloc(*(unsigned int *)(v5 + 288), 4uLL);
    v113 = *(_DWORD *)(v5 + 288);
    if (*(_DWORD *)(*(_QWORD *)(v5 + 160) + 28) == 0x20000)
    {
      v114 = 8 * v113 + 264;
      *(_DWORD *)(v5 + 332) = v114;
      *(_QWORD *)(v5 + 336) = sub_206329DA0(v114, 1);
      v115 = *(_DWORD *)(v5 + 332) + 50;
    }
    else
    {
      v116 = 4 * v113 + 4;
      *(_DWORD *)(v5 + 344) = v116;
      *(_QWORD *)(v5 + 352) = sub_206329DA0(v116, 1);
      v115 = *(_DWORD *)(v5 + 344);
    }
    if (*(_DWORD *)(*(_QWORD *)(v5 + 160) + 24) == 460)
    {
      v117 = -1;
    }
    else
    {
      v118 = (1374389535 * (unint64_t)(*(_DWORD *)(a4 + 20) * ((v111 + 4095) >> 12))) >> 32;
      v117 = (((_DWORD)v118 << 7) & 0xFFFFF000) - v115;
      if (v117 <= 0xECA)
        v117 = 3786;
      if ((((_DWORD)v118 << 7) & 0xFFFFF000) == 0)
        v117 = 3786;
    }
    *(_DWORD *)(v5 + 296) = v117;
  }
  sub_2063275D0((_DWORD *)v5);
  return v5;
}

uint64_t WriteToStreamCompressor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int v10;
  unsigned int *v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  size_t v20;
  unsigned int v21;
  _DWORD *v22;
  char *v23;
  uint64_t v24;
  unsigned int v25;
  int v27;
  int *v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  int v36;
  unsigned int *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  _DWORD *v51;
  uint64_t v52;
  unint64_t v53;
  unsigned int v54;
  _QWORD v55[7];

  if (!a1)
  {
    v12 = 22;
    goto LABEL_53;
  }
  if (*(_BYTE *)(a1 + 322))
    sub_206325F84(a1, "written to after it was closed", a3, a4, a5, a6, a7, a8, v45);
  v9 = *(_QWORD *)(a1 + 160);
  v10 = *(unsigned __int8 *)(v9 + 12);
  v11 = (unsigned int *)(v9 + 8);
  if (v10)
    v11 = (unsigned int *)(a1 + 240);
  v12 = *v11;
  if (*v11)
  {
LABEL_53:
    *__error() = v12;
    return -1;
  }
  v13 = a3;
  if (!a3)
    return 0;
  if ((unint64_t)(*(_QWORD *)(a1 + 272) + a3) > *(_QWORD *)(a1 + 264))
  {
    sub_206324734(CFSTR("%s:%d: Error: wrote %llu bytes to file of size %llu\n"), a2, a3, a4, a5, a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
    v12 = 22;
    goto LABEL_52;
  }
  v15 = (char *)a2;
  if (v10 && *(_BYTE *)(a1 + 324))
  {
    v12 = 28;
    goto LABEL_53;
  }
  v14 = 0;
  v16 = (_QWORD *)(a1 + 360);
  v17 = MEMORY[0x24BDAC760];
  do
  {
    sub_20632796C(a1, a2, a3, a4, a5, a6, a7, a8);
    v18 = *(unsigned int *)(a1 + 360);
    v19 = (*(_DWORD *)(a1 + 364) - v18);
    if (v13 >= v19)
      v20 = v19;
    else
      v20 = v13;
    memcpy((void *)(*(_QWORD *)(a1 + 368) + v18), v15, v20);
    v21 = v20 + *(_DWORD *)(a1 + 360);
    *(_DWORD *)(a1 + 360) = v21;
    *(_QWORD *)(a1 + 272) += v20;
    if (*(_DWORD *)(a1 + 364) == v21)
    {
      v22 = *(_DWORD **)(a1 + 368);
      if (!v22)
        __assert_rtn("emitCurBuffer", "StreamCompressor.cpp", 548, "curBuffer");
      if (*(_BYTE *)(a1 + 304))
      {
        v23 = (char *)v22 - *(char *)(a1 + 376);
        v24 = *(_QWORD *)(a1 + 312);
        v46 = v17;
        v47 = 0x40000000;
        v48 = sub_206326808;
        v49 = &unk_24BEFF428;
        v50 = a1;
        v51 = v22;
        v54 = v21;
        v52 = v24;
        v53 = (unint64_t)v23;
        v55[0] = v17;
        v55[1] = 1107296256;
        v55[2] = sub_20632683C;
        v55[3] = &unk_24BEFF4F8;
        v55[4] = &v46;
        v55[5] = a1;
        sub_206325D8C(a1, 3u, 0, (uint64_t)v55, a5, a6, a7, a8);
        *(_QWORD *)(a1 + 312) += v21;
LABEL_47:
        ++*(_DWORD *)(a1 + 416);
        *(_QWORD *)(a1 + 384) = 0;
        *(_DWORD *)(a1 + 392) = 0;
        *v16 = 0;
        *(_QWORD *)(a1 + 368) = 0;
        sub_2063275D0((_DWORD *)a1);
        goto LABEL_48;
      }
      if (*(_BYTE *)(a1 + 320))
      {
LABEL_46:
        v32 = *(_DWORD *)(a1 + 416);
        v33 = *(_QWORD *)(a1 + 384);
        v34 = *(_DWORD *)(a1 + 392);
        v46 = v17;
        v47 = 0x40000000;
        v48 = sub_20632689C;
        v49 = &unk_24BEFF448;
        v50 = a1;
        v51 = v22;
        v52 = v33;
        v53 = __PAIR64__(v21, v32);
        v54 = v34;
        sub_206325D8C(a1, 0, 0, (uint64_t)&v46, a5, a6, a7, a8);
        goto LABEL_47;
      }
      v25 = *(_DWORD *)(*(_QWORD *)(a1 + 160) + 64);
      if (v21 < 0x1C || v25 == 0)
        goto LABEL_45;
      v27 = *v22;
      if (*v22 == -1095041334)
      {
        v29 = bswap32(v22[1]);
        v30 = bswap32(v22[4]);
      }
      else
      {
        v28 = *(int **)(a1 + 368);
        if (v27 != -889275714)
        {
LABEL_35:
          if ((v27 + 17958194) < 2)
          {
            v31 = v28[3];
          }
          else
          {
            if (v27 != -822415874 && v27 != -805638658)
              goto LABEL_45;
            v31 = bswap32(v28[3]);
          }
          if (v31)
          {
            if (v31 < 0x20)
            {
              if (((v25 >> v31) & 1) != 0)
                goto LABEL_44;
            }
            else
            {
              sub_206324734(CFSTR("%s:%d: Error: file type of %s is out of range\n"), a2, a3, a4, a5, a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
            }
          }
LABEL_45:
          *(_BYTE *)(a1 + 320) = 1;
          goto LABEL_46;
        }
        v29 = v22[1];
        v30 = v22[4];
      }
      if (v29 > 0x13)
      {
LABEL_44:
        *(_BYTE *)(a1 + 324) = 1;
        goto LABEL_45;
      }
      if (v30 + 28 > v21)
      {
        sub_206324734(CFSTR("%s:%d: Error: the first mach header of %s is not in the first %zu bytes, assuming we need to skip it\n"), a2, a3, a4, a5, a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressorQueue.c");
        goto LABEL_44;
      }
      v28 = (_DWORD *)((char *)v22 + v30);
      v27 = *v28;
      goto LABEL_35;
    }
LABEL_48:
    v14 += v20;
    v15 += v20;
    v13 -= v20;
  }
  while (v13);
  v35 = *(_QWORD *)(a1 + 160);
  v36 = *(unsigned __int8 *)(v35 + 12);
  v37 = (unsigned int *)(v35 + 8);
  if (v36)
    v37 = (unsigned int *)(a1 + 240);
  v12 = *v37;
  if (*v37)
  {
LABEL_52:
    sub_206326664((int *)a1, v12);
    sub_206326A78(a1, 3, v38, v39, v40, v41, v42, v43);
    goto LABEL_53;
  }
  return v14;
}

uint64_t CloseStreamCompressor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int *v10;
  int v11;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  char v34;
  void *v35[2];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v9 = *(_QWORD *)(a1 + 160);
    if (*(_BYTE *)(a1 + 322))
      sub_206325F84(a1, "double-closed", a3, a4, a5, a6, a7, a8, v34);
    *(_BYTE *)(a1 + 322) = 1;
    v10 = (int *)(a1 + 240);
    if (!*(_BYTE *)(v9 + 12))
      v10 = (int *)(v9 + 8);
    v11 = *v10;
    if (*(_QWORD *)(a1 + 272) != *(_QWORD *)(a1 + 264) && v11 == 0)
    {
      if (*(_BYTE *)(v9 + 12) && *(_BYTE *)(a1 + 324))
        goto LABEL_14;
      *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v38 = v16;
      v39 = v16;
      v36 = v16;
      v37 = v16;
      *(_OWORD *)v35 = v16;
      backtrace(v35, 10);
      sub_206324734(CFSTR("%s:%d: %p %p %p %p %p %p %p %p %p %p: Error: wrote %llu bytes but expected %llu bytes\n"), v17, v18, v19, v20, v21, v22, v23, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/StreamCompressor.cpp");
      v11 = 22;
    }
    else if (!v11)
    {
LABEL_14:
      v14 = *(NSObject **)(a1 + 216);
      v15 = *(NSObject **)(a1 + 192);
      v35[0] = (void *)MEMORY[0x24BDAC760];
      v35[1] = (void *)0x40000000;
      *(_QWORD *)&v36 = sub_206327900;
      *((_QWORD *)&v36 + 1) = &unk_24BEFF4A8;
      *(_QWORD *)&v37 = a1;
      sub_2063264A8(v9, v14, v15, (uint64_t)v35);
      v13 = 0;
LABEL_17:
      DrainStreamCompressorQueue(v9);
      return v13;
    }
    sub_206326664((int *)a1, v11);
    sub_206326A78(a1, 3, v24, v25, v26, v27, v28, v29);
    v30 = *(_QWORD *)(a1 + 160);
    v31 = *(NSObject **)(a1 + 216);
    v32 = *(NSObject **)(a1 + 192);
    v35[0] = (void *)MEMORY[0x24BDAC760];
    v35[1] = (void *)0x40000000;
    *(_QWORD *)&v36 = sub_206327900;
    *((_QWORD *)&v36 + 1) = &unk_24BEFF4A8;
    *(_QWORD *)&v37 = a1;
    sub_2063264A8(v30, v31, v32, (uint64_t)v35);
    *__error() = v11;
    v13 = 0xFFFFFFFFLL;
    goto LABEL_17;
  }
  *__error() = 22;
  return 0xFFFFFFFFLL;
}

void *AFSCLockFilePath()
{
  return &unk_2544F1280;
}

void *AFSCLockFileFd()
{
  return &unk_2544F1280;
}

uint64_t AFSCUnlockFile()
{
  return 0;
}

uint64_t sub_206328F60(int a1, int *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int *v10;
  uint64_t result;

  if ((a1 - 15) <= 0xFFFFFFF1)
  {
    sub_206324734(CFSTR("%s:%d: Error: type %d out of range\n"), (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
    goto LABEL_8;
  }
  v10 = &dword_20632ADFC[3 * a1];
  if (!*v10 || ((0x67uLL >> a1) & 1) != 0)
  {
    sub_206324734(CFSTR("%s:%d: Error: unknown compressor %d\n"), (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
LABEL_8:
    result = 0;
    v10 = dword_20632ADFC;
    if (!a2)
      goto LABEL_10;
    goto LABEL_9;
  }
  result = 1;
  if (a2)
LABEL_9:
    *a2 = *v10;
LABEL_10:
  if (a3)
    *a3 = v10[1];
  return result;
}

size_t sub_20632902C(size_t algorithm, const uint8_t *a2, unsigned int a3, uint8_t *a4, unsigned int a5, int a6)
{
  size_t v6;
  size_t v12;
  void *v13;
  size_t v14;

  v6 = algorithm;
  if ((_DWORD)algorithm)
  {
    v12 = compression_encode_scratch_buffer_size((compression_algorithm)algorithm);
    if (v12)
    {
      v13 = malloc(v12);
      if (!v13)
        return 0;
    }
    else
    {
      v13 = 0;
    }
    if (a6 == 1)
      v14 = compression_encode_buffer(a4, a5, a2, a3, v13, (compression_algorithm)v6);
    else
      v14 = compression_decode_buffer(a4, a5, a2, a3, v13, (compression_algorithm)v6);
    v6 = v14;
    if (v13)
      free(v13);
  }
  return v6;
}

int *sub_2063290DC(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  unint64_t v17;

  *(_QWORD *)a1 = a2;
  sub_206328F60(*(_DWORD *)(*(_QWORD *)(a2 + 16) + 8), a1 + 2, a1 + 3, a4, a5, a6, a7, a8);
  v16 = a1[3];
  if (v16 == 196608 || v16 == 0x20000)
  {
    v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 16) + 12) + 0xFFFFLL;
    if (HIWORD(v17))
      __assert_rtn("CompressedFile", "ChunkCompression.cpp", 249, "numChunks <= UINT32_MAX");
    a1[4] = v17 >> 16;
  }
  else if (v16 == 0x10000)
  {
    a1[4] = 1;
  }
  else
  {
    sub_206324734(CFSTR("%s:%d: %s: unknown chunking scheme %llu\n"), v9, v10, v11, v12, v13, v14, v15, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
  }
  return a1;
}

uint64_t sub_2063291B4(uint64_t **a1, void *value, size_t size, uint64_t position, int *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  int v21;
  ssize_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v10 = *a1;
  v11 = **a1;
  if (v11)
  {
    v38 = 0;
    v12 = (*(uint64_t (**)(uint64_t, uint64_t, size_t, void *, uint64_t *))(v11 + 16))(v11, position, size, value, &v38);
    *a5 = v12;
    if (v12)
    {
      sub_206324734(CFSTR("%s:%d: %s: readRscData: (%llu, %zu), returned error [%d]"), v13, v14, v15, v16, v17, v18, v19, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
      return 0;
    }
    if (v38 != size)
    {
      sub_206324734(CFSTR("%s:%d: %s: readRscData: (%llu, %zu), returned size [%lu]\n"), v13, v14, v15, v16, v17, v18, v19, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
      *a5 = 5;
      return 0;
    }
    return 1;
  }
  if (position < 0x100000000)
  {
    v22 = getxattr((const char *)v10[1], "com.apple.ResourceFork", value, size, position, 32);
    if (v22 == -1)
    {
      *a5 = *__error();
      v30 = __error();
      strerror(*v30);
      sub_206324734(CFSTR("%s:%d: %s: fgetxattr(%llu,%zu): %s\n"), v31, v32, v33, v34, v35, v36, v37, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
      return 0;
    }
    if (v22 == size)
      return 1;
    sub_206324734(CFSTR("%s:%d: %s: fgetxattr(%llu,%zu) returned %zu\n"), v23, v24, v25, v26, v27, v28, v29, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
    result = 0;
    v21 = 5;
  }
  else
  {
    sub_206324734(CFSTR("%s:%d: %s: position=%lld is too big\n"), (uint64_t)value, size, (uint64_t)value, (uint64_t)a5, a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
    result = 0;
    v21 = 22;
  }
  *a5 = v21;
  return result;
}

_QWORD *sub_206329380(_QWORD *result, size_t __size)
{
  unsigned int v2;
  _QWORD *v3;
  void *v4;

  if (*((_DWORD *)result + 8) < __size)
  {
    v2 = __size;
    v3 = result;
    v4 = (void *)result[3];
    if (v4)
      free(v4);
    result = malloc(v2);
    v3[3] = result;
    *((_DWORD *)v3 + 8) = v2;
  }
  return result;
}

uint64_t sub_2063293C8(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, size_t *a6, uint64_t a7, uint64_t a8)
{
  unsigned int v11;
  int v13;
  _DWORD *v14;
  _BYTE *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t result;
  size_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  unsigned int v30;
  uint64_t v31;
  size_t v32;
  char *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  unsigned int v37;
  compression_algorithm v38;
  size_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  size_t v47;
  unsigned int v48;
  void *v49;
  size_t v50;
  unsigned int v51;
  uint64_t v52;
  char *v53;
  char v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  char v58;
  unsigned int v59;
  _QWORD value[2];

  value[1] = *MEMORY[0x24BDAC8D0];
  v59 = 0;
  if (*((_DWORD *)a1 + 4) <= a2)
  {
    sub_206324734(CFSTR("%s:%d: %s: attempting to read chunk %u from file with %u chunks\n"), a2, a3, a4, a5, (uint64_t)a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
    return 22;
  }
  v11 = a4;
  v13 = *((_DWORD *)a1 + 3);
  if (v13 != 196608)
  {
    if (v13 != 0x20000)
    {
      if (v13 != 0x10000)
      {
        sub_206324734(CFSTR("%s:%d: %s: unknown chunking scheme %llu\n"), a2, a3, a4, a5, (uint64_t)a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
        return 22;
      }
      v14 = *(_DWORD **)(*a1 + 16);
      v16 = *v14;
      v15 = v14 + 5;
      a1[3] = v15;
      v17 = v16 - 16;
      if (v16 <= 0x10)
      {
        sub_206324734(CFSTR("%s:%d: %s: decmpfs xattr size (%u) should be greater than decmpfs disk header size (%zu)\n"), a2, a3, a4, a5, (uint64_t)a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
        return 22;
      }
LABEL_26:
      v29 = *((_DWORD *)a1 + 2);
      if (*v15 == v29)
      {
        v30 = v17 - 1;
        if (v30)
        {
          v31 = 0;
          v32 = 0;
          v33 = v15 + 1;
          do
          {
            v34 = a5 + 16 * v31;
            v35 = *(void **)v34;
            if (*(_QWORD *)(v34 + 8) >= (uint64_t)v30)
              LODWORD(v36) = v30;
            else
              v36 = *(_QWORD *)(v34 + 8);
            if (v35)
              memcpy(v35, v33, v36);
            v32 += v36;
            if (v31 + 1 >= (unint64_t)v11)
              break;
            v33 += v36;
            v31 = 1;
            v30 -= v36;
          }
          while (v30);
          goto LABEL_85;
        }
LABEL_84:
        v32 = 0;
LABEL_85:
        result = 0;
        *a6 = v32;
        return result;
      }
      *a6 = 0;
      if (v29 > 1278)
      {
        if (v29 == 1279)
        {
          v38 = COMPRESSION_LZFSE;
        }
        else
        {
          if (v29 != 1535)
            goto LABEL_47;
          v38 = COMPRESSION_LZBITMAP;
        }
        if (a1[7])
        {
          v37 = 0;
          goto LABEL_55;
        }
      }
      else
      {
        if (v29 != 767)
        {
          if (v29 == 774)
          {
            v37 = 0;
            v38 = 2304;
LABEL_55:
            if (v11 == 1)
            {
              v39 = compression_decode_buffer(*(uint8_t **)a5, *(_QWORD *)(a5 + 8), &v15[v37], v17 - v37, (void *)a1[7], v38);
              if (v39)
              {
                v47 = v39;
                result = 0;
                *a6 = v47;
                return result;
              }
              goto LABEL_74;
            }
            if (a3 >= 0x100000000)
            {
              sub_206324734(CFSTR("%s:%d: %s: vecTotal=%lld is too big for compression algorithm 0x%x\n"), a2, a3, a4, a5, (uint64_t)a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
              return 22;
            }
            v48 = *((_DWORD *)a1 + 12);
            v49 = (void *)a1[5];
            if (v48 < a3)
            {
              if (v49)
                free(v49);
              v49 = malloc(a3);
              a1[5] = v49;
              *((_DWORD *)a1 + 12) = a3;
              v48 = a3;
            }
            if (v49)
            {
              v50 = compression_decode_buffer((uint8_t *)v49, v48, (const uint8_t *)(a1[3] + v37), v17 - v37, (void *)a1[7], v38);
              if (v50)
              {
                v51 = v50;
                if (HIDWORD(v50))
                {
                  sub_206324734(CFSTR("%s:%d: %s: decmpSize=%zu is too big\n"), v40, v41, v42, v43, v44, v45, v46, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
                  return 22;
                }
                if ((_DWORD)v50)
                {
                  v52 = 0;
                  v32 = 0;
                  v53 = (char *)a1[5];
                  v54 = 1;
                  do
                  {
                    v55 = a5 + 16 * v52;
                    v56 = *(void **)v55;
                    if (*(_QWORD *)(v55 + 8) >= (uint64_t)v51)
                      LODWORD(v57) = v51;
                    else
                      v57 = *(_QWORD *)(v55 + 8);
                    if (v56)
                      memcpy(v56, v53, v57);
                    v32 += v57;
                    v51 -= v57;
                    v53 += v57;
                    v58 = v54 & (v51 != 0);
                    v52 = 1;
                    v54 = 0;
                  }
                  while ((v58 & 1) != 0);
                  goto LABEL_85;
                }
                goto LABEL_84;
              }
LABEL_74:
              sub_206324734(CFSTR("%s:%d: %s: decode failed for compression algorithm 0x%x\n"), v40, v41, v42, v43, v44, v45, v46, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
              return 22;
            }
            sub_206324734(CFSTR("%s:%d: %s: allocating buffer of size %llu failed for compression algorithm 0x%x\n"), a2, a3, a4, a5, (uint64_t)a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
            return 12;
          }
LABEL_47:
          sub_206324734(CFSTR("%s:%d: %s: unknown compression scheme %llu\n"), a2, a3, a4, a5, (uint64_t)a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
          return 22;
        }
        if (a1[7])
        {
          if (v17 < 2 || (*v15 & 0xF) != 8)
          {
            sub_206324734(CFSTR("%s:%d: %s: invalid zlib header\n"), a2, a3, a4, a5, (uint64_t)a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
            return 22;
          }
          v37 = 2;
          v38 = COMPRESSION_ZLIB;
          goto LABEL_55;
        }
      }
      sub_206324734(CFSTR("%s:%d: %s: workbuffer allocation failed\n"), a2, a3, a4, a5, (uint64_t)a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
      return 12;
    }
    value[0] = 0xAAAAAAAAAAAAAAAALL;
    if ((sub_2063291B4((uint64_t **)a1, value, 8uLL, 8 * a2 + 264, (int *)&v59, (uint64_t)a6, a7, a8) & 1) != 0)
    {
      sub_206329380(a1, HIDWORD(value[0]));
      v28 = (void *)a1[3];
      if (v28)
      {
        if ((sub_2063291B4((uint64_t **)a1, v28, HIDWORD(value[0]), LODWORD(value[0]) + 260, (int *)&v59, v23, v24, v25) & 1) != 0)
        {
          result = 0;
          v17 = HIDWORD(value[0]);
          goto LABEL_24;
        }
        goto LABEL_23;
      }
LABEL_62:
      sub_206324734(CFSTR("%s:%d: %s: allocating buffer of size %u failed\n"), 0, v20, v21, v22, v23, v24, v25, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
      v17 = 0;
      result = 12;
      goto LABEL_24;
    }
LABEL_23:
    v17 = 0;
    result = v59;
    goto LABEL_24;
  }
  value[0] = 0xAAAAAAAAAAAAAAAALL;
  if ((sub_2063291B4((uint64_t **)a1, value, 8uLL, 4 * a2, (int *)&v59, (uint64_t)a6, a7, a8) & 1) == 0)
    goto LABEL_23;
  v19 = (HIDWORD(value[0]) - LODWORD(value[0]));
  if (HIDWORD(value[0]) <= LODWORD(value[0]))
  {
    sub_206324734(CFSTR("%s:%d: %s: resource fork offsets are out of order (offsets[1] (%u) <= offsets[0] (%u)) \n"), a2, a3, a4, a5, (uint64_t)a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
    v17 = 0;
    result = 22;
    goto LABEL_24;
  }
  sub_206329380(a1, (HIDWORD(value[0]) - LODWORD(value[0])));
  v26 = (void *)a1[3];
  if (!v26)
    goto LABEL_62;
  v27 = sub_2063291B4((uint64_t **)a1, v26, v19, LODWORD(value[0]), (int *)&v59, v23, v24, v25);
  if (v27)
    v17 = v19;
  else
    v17 = 0;
  if (v27)
    result = 0;
  else
    result = v59;
LABEL_24:
  if (!(_DWORD)result)
  {
    v15 = (_BYTE *)a1[3];
    goto LABEL_26;
  }
  return result;
}

uint64_t sub_2063299B8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unint64_t v12;
  int v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  compression_algorithm v23;
  size_t v24;
  size_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  unint64_t v56;
  unint64_t v57;
  __int128 v58;
  void *v59[2];
  void *v60[2];
  void *v61[2];
  unint64_t v62;
  size_t v63;

  v8 = 22;
  if (!(_DWORD)a4 || !a5)
    return v8;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 12);
  if (v12 <= a2)
  {
    v8 = 0;
    *a6 = 0;
    return v8;
  }
  if ((((unsigned __int128)(a3 + (__int128)(uint64_t)a2) >> 64) & 1) != 0)
  {
    sub_206324734(CFSTR("%s:%d: add overflow: offset %llu, totalSize %llu\n"), a1, a3, a4, (uint64_t)a5, (uint64_t)a6, a7, a8, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
    return v8;
  }
  v13 = a4;
  if (v12 >= a3 + a2)
    v14 = a3;
  else
    v14 = v12 - a2;
  v62 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)v60 = v15;
  *(_OWORD *)v61 = v15;
  v58 = v15;
  *(_OWORD *)v59 = v15;
  sub_2063290DC((int *)&v58, a1, a3, a4, (uint64_t)a5, (uint64_t)a6, a7, a8);
  v59[1] = 0;
  LODWORD(v60[0]) = 0;
  v60[1] = 0;
  LODWORD(v61[0]) = 0;
  v61[1] = 0;
  v62 = 0;
  if (SDWORD2(v58) <= 773)
  {
    if (DWORD2(v58) == 460)
      goto LABEL_23;
    if (DWORD2(v58) != 767)
      goto LABEL_22;
    v23 = COMPRESSION_ZLIB;
  }
  else
  {
    switch(DWORD2(v58))
    {
      case 0x5FF:
        v23 = COMPRESSION_LZBITMAP;
        break;
      case 0x4FF:
        v23 = COMPRESSION_LZFSE;
        break;
      case 0x306:
        v23 = 2304;
        break;
      default:
LABEL_22:
        sub_206324734(CFSTR("%s:%d: %s: unknown compression scheme %llu\n"), v16, v17, v18, v19, v20, v21, v22, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
        goto LABEL_23;
    }
  }
  v24 = compression_decode_scratch_buffer_size(v23);
  if (v24)
  {
    v25 = v24;
    v61[1] = malloc(v24);
    v62 = v25;
  }
LABEL_23:
  v26 = calloc(v13 + 1, 0x10uLL);
  if (!v26)
  {
    sub_206324734(CFSTR("%s:%d: allocation of %zu bytes failed\n"), v27, v28, v29, v30, v31, v32, v33, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
    v8 = 12;
    goto LABEL_72;
  }
  v34 = (uint64_t)v26;
  if (!a2)
  {
    v35 = 0;
    v36 = 0;
LABEL_31:
    v38 = 0;
    v37 = 0x10000;
    goto LABEL_32;
  }
  if (HIWORD(a2))
  {
    sub_206324734(CFSTR("%s:%d: invalid offset: %llu\n"), v27, v28, v29, v30, v31, v32, v33, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ChunkCompression.cpp");
    goto LABEL_71;
  }
  v35 = a2 >> 16;
  v36 = a2 & 0xFFFF00000000FFFFLL;
  if ((a2 & 0xFFFF00000000FFFFLL) == 0)
    goto LABEL_31;
  *v26 = 0;
  v26[1] = v36;
  v37 = 0x10000 - v36;
  v38 = 1;
LABEL_32:
  v39 = 0;
  v40 = 0;
  v41 = 0;
  v42 = v36;
  v56 = v36;
  v57 = v36;
  while (1)
  {
    v43 = &a5[2 * v40];
    v44 = v43[1] - v41;
    if (v44 >= v37)
      v44 = v37;
    if (v44 >= v14)
      v44 = v14;
    v45 = (_QWORD *)(v34 + 16 * v38);
    v45[1] = v44;
    if (*v43)
      v46 = *v43 + v41;
    else
      v46 = 0;
    *v45 = v46;
    v14 -= v44;
    if (v44 + v41 == v43[1])
    {
      ++v40;
      v41 = 0;
    }
    else
    {
      v41 += v44;
    }
    if (v37 != v44 && v14 != 0 && v40 != v13)
      goto LABEL_62;
    v49 = v44 + v42;
    v50 = v38 + 1;
    while (1)
    {
      v51 = v50 - 1;
      if (*(_QWORD *)(v34 + 16 * (v50 - 1)))
        break;
      v49 -= *(_QWORD *)(v34 + 16 * v51 + 8);
      v50 = 1;
      if (!v51)
        goto LABEL_62;
    }
    v63 = 0;
    if (v13 != 1
      || !v57
      || (_DWORD)v50 != 2
      || *(_QWORD *)v34
      || (v52 = *(_QWORD *)(v34 + 24) + *(_QWORD *)(v34 + 8), v52 > a5[1]))
    {
      v53 = sub_2063293C8(&v58, v35, v49, v50, v34, &v63, v32, v33);
      if ((_DWORD)v53)
        break;
      goto LABEL_61;
    }
    *(_QWORD *)(v34 + 8) = v52;
    *(_QWORD *)v34 = *a5;
    v53 = sub_2063293C8(&v58, v35, v49, 1, v34, &v63, v32, v33);
    if ((_DWORD)v53)
      break;
    memmove(*(void **)v34, (const void *)(*(_QWORD *)v34 + v57), *(_QWORD *)(v34 + 8) - v57);
    v57 = 0;
LABEL_61:
    v39 += v63;
LABEL_62:
    v38 = 0;
    v42 = 0;
    v35 = (v35 + 1);
    if (v14)
      v54 = v40 == v13;
    else
      v54 = 1;
    v37 = 0x10000;
    if (v54)
    {
      free((void *)v34);
      v8 = 0;
      *a6 = v39 - v56;
      goto LABEL_72;
    }
  }
  v8 = v53;
LABEL_71:
  free((void *)v34);
LABEL_72:
  if (HIDWORD(v58) != 0x10000 && v59[1])
    free(v59[1]);
  if (v60[1])
    free(v60[1]);
  if (v61[1])
    free(v61[1]);
  return v8;
}

void *sub_206329DA0(unsigned int a1, int a2)
{
  if (a2)
  {
    if (qword_2544F12C8 != -1)
      dispatch_once(&qword_2544F12C8, &unk_24BEFF820);
    dispatch_semaphore_wait((dispatch_semaphore_t)qword_2544F12D0, 0xFFFFFFFFFFFFFFFFLL);
    return malloc(a1);
  }
  if (qword_2544F12C8 != -1)
    dispatch_once(&qword_2544F12C8, &unk_24BEFF820);
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)qword_2544F12D0, 0))
    return malloc(a1);
  return 0;
}

dispatch_semaphore_t sub_206329E3C()
{
  unint64_t v0;
  intptr_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  dispatch_semaphore_t result;
  size_t v11;
  unint64_t v12;
  int v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11 = 8;
  v12 = 0;
  *(_QWORD *)v13 = 0x1800000006;
  if (sysctl(v13, 2u, &v12, &v11, 0, 0) == -1)
  {
    v2 = __error();
    strerror(*v2);
    sub_206324734(CFSTR("%s:%d: sysctl: %s\n"), v3, v4, v5, v6, v7, v8, v9, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ThrottlingAllocator.c");
    v12 = 0;
    goto LABEL_7;
  }
  v0 = v12;
  if (!(v12 >> 31))
  {
LABEL_7:
    v1 = 8194;
    goto LABEL_8;
  }
  v12 -= 0x80000000;
  if (v0 - 0x80000000 >= 0x20020000)
    v1 = (int)((uint64_t)(v0 - 0x80000000) >> 16);
  else
    v1 = 8194;
LABEL_8:
  result = dispatch_semaphore_create(v1);
  qword_2544F12D0 = (uint64_t)result;
  return result;
}

void *sub_206329F28(void *result)
{
  if (result)
  {
    free(result);
    if (qword_2544F12C8 != -1)
      dispatch_once(&qword_2544F12C8, &unk_24BEFF820);
    return (void *)dispatch_semaphore_signal((dispatch_semaphore_t)qword_2544F12D0);
  }
  return result;
}

int *sub_206329F74()
{
  char *v0;
  char *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  rlim_t rlim_max;
  rlim_t rlim_cur;
  rlim_t v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  rlim_t v37;
  BOOL v38;
  unint64_t v39;
  intptr_t v40;
  int *result;
  int *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  rlimit v50;

  v0 = getenv("AFSC_MAX_FDS");
  v1 = v0;
  if (v0)
  {
    v2 = atoi(v0);
    sub_206324734(CFSTR("%s:%d: Error: using max fds override of %d\n"), v3, v4, v5, v6, v7, v8, v9, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ThrottlingAllocator.c");
  }
  else
  {
    v2 = 48;
  }
  v50.rlim_cur = 0;
  v50.rlim_max = 0;
  if (getrlimit(8, &v50) == -1)
  {
    v42 = __error();
    strerror(*v42);
    return sub_206324734(CFSTR("%s:%d: getrlimit: %s\n"), v43, v44, v45, v46, v47, v48, v49, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ThrottlingAllocator.c");
  }
  else
  {
    v10 = v2;
    if (v50.rlim_max >= 0x2800)
      rlim_max = 10240;
    else
      rlim_max = v50.rlim_max;
    if (v50.rlim_cur >= rlim_max)
      rlim_cur = rlim_max;
    else
      rlim_cur = v50.rlim_cur;
    v13 = rlim_cur + v10;
    if (rlim_cur + v10 >= rlim_max)
      v13 = rlim_max;
    v50.rlim_cur = v13;
    if (setrlimit(8, &v50) == -1)
    {
      v14 = __error();
      strerror(*v14);
      sub_206324734(CFSTR("%s:%d: setrlimit(RLIMIT_NOFILE.rlim_cur = %lld): %s\n"), v15, v16, v17, v18, v19, v20, v21, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ThrottlingAllocator.c");
    }
    if (getrlimit(8, &v50) == -1)
    {
      v29 = __error();
      strerror(*v29);
      sub_206324734(CFSTR("%s:%d: getrlimit(RLIMIT_NOFILE): %s\n"), v30, v31, v32, v33, v34, v35, v36, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ThrottlingAllocator.c");
    }
    v37 = v50.rlim_cur;
    if (v50.rlim_cur >= rlim_max)
      v37 = rlim_max;
    v38 = v37 >= rlim_cur;
    v39 = v37 - rlim_cur;
    if (!v38)
      v39 = 0;
    if (v39 <= 0xA)
      v39 = 10;
    if (v39 >= v10)
      v40 = v10;
    else
      v40 = v39;
    if (v1)
    {
      if (v39 < v10)
        sub_206324734(CFSTR("%s:%d: Error: could not use desired max fds of %d, using %llu instead\n"), v22, v23, v24, v25, v26, v27, v28, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/ThrottlingAllocator.c");
    }
    result = (int *)dispatch_semaphore_create(v40);
    qword_2544F12C0 = (uint64_t)result;
  }
  return result;
}

uint64_t type5_handler_function(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  int v5;
  int *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  char *v15;
  int *v16;
  char *v17;
  _QWORD v19[5];
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  _BYTE v24[48];
  uint64_t v25;

  v25 = 0x34F2326416E94937;
  v2 = guarded_open_np();
  if (v2 == -1)
  {
    v16 = __error();
    v17 = strerror(*v16);
    syslog(3, "afsc open: %s", v17);
    return 0;
  }
  v3 = v2;
  v4 = MEMORY[0x24BDAC760];
  v5 = v2;
  while (1)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x4800000000;
    memset(v24, 0, sizeof(v24));
    if (read(v3, v24, 0x30uLL) != 48)
    {
      v6 = __error();
      v7 = strerror(*v6);
      syslog(3, "read request from %d: %s", v5, v7);
    }
    v8 = v22[4];
    if (v8 != 2)
      break;
    (*(void (**)(uint64_t, uint64_t))(a1 + 8))(v22[5], v22[6]);
    if (write(v3, v22 + 3, 0x30uLL) != 48)
    {
      v14 = __error();
      v15 = strerror(*v14);
      syslog(3, "send response to %d: %s", v3, v15);
    }
LABEL_10:
    _Block_object_dispose(&v21, 8);
  }
  if (v8 == 1)
  {
    v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))a1;
    v10 = v22[5];
    v11 = v22[6];
    v12 = v22[7];
    v13 = v22[8];
    v19[0] = v4;
    v19[1] = 1107296256;
    v19[2] = sub_20632A338;
    v19[3] = &unk_24BEFF840;
    v19[4] = &v21;
    v20 = v3;
    v9(v10, v11, v12, v13, v19);
    goto LABEL_10;
  }
  syslog(3, "unknown request type from %d: %lld\n", v3, v8);
  _Block_object_dispose(&v21, 8);
  return 0;
}

void sub_20632A338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v5;
  int *v6;
  char *v7;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = a4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56) = a3;
  if (write(*(_DWORD *)(a1 + 40), (const void *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0x30uLL) != 48)
  {
    v5 = *(_DWORD *)(a1 + 40);
    v6 = __error();
    v7 = strerror(*v6);
    syslog(3, "send response to %d: %s", v5, v7);
  }
}

void sub_20632A3C4(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
}

void sub_20632A3D4(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

uint64_t VolumeSupportsCompression(const char *a1)
{
  timespec v2;
  dev_t st_dev;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *i;
  int *v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v31;
  int v32;
  stat v33;
  char __b[1024];
  statfs v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (qword_2544F12D8 != -1)
    dispatch_once(&qword_2544F12D8, &unk_24BEFF890);
  memset(__b, 170, sizeof(__b));
  v2.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v2.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v33.st_dev = v2;
  *(timespec *)&v33.st_uid = v2;
  v33.st_atimespec = v2;
  v33.st_mtimespec = v2;
  v33.st_ctimespec = v2;
  v33.st_birthtimespec = v2;
  *(timespec *)&v33.st_size = v2;
  *(timespec *)&v33.st_blksize = v2;
  *(timespec *)v33.st_qspare = v2;
  if (realpath_DARWIN_EXTSN(a1, __b))
  {
    if (lstat(__b, &v33) == -1)
    {
LABEL_9:
      v12 = __error();
      strerror(*v12);
      sub_206324734(CFSTR("%s:%d: lstat %s: %s\n"), v13, v14, v15, v16, v17, v18, v19, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/pathUtils.c");
      return 0;
    }
    st_dev = v33.st_dev;
    if (v33.st_dev == dword_2544F1258)
    {
      *(_WORD *)__b = 47;
    }
    else
    {
      for (i = &__b[strlen(__b) - 1]; i > __b; --i)
      {
        if (*i == 47)
        {
          *i = 0;
          if (lstat(__b, &v33) == -1)
            goto LABEL_9;
          if (v33.st_dev != st_dev)
          {
            *i = 47;
            break;
          }
        }
      }
    }
  }
  else
  {
    memset(&v35, 170, sizeof(v35));
    if (statfs(a1, &v35))
    {
      v4 = __error();
      strerror(*v4);
LABEL_21:
      sub_206324734(CFSTR("%s:%d: statfs %s: %s\n"), v5, v6, v7, v8, v9, v10, v11, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/pathUtils.c");
      return 0;
    }
    __strlcpy_chk();
  }
  v32 = 0;
  v31 = xmmword_20632AEB0;
  *(_OWORD *)&v33.st_dev = xmmword_20632AEC4;
  *(_QWORD *)&v33.st_uid = 0;
  if (getattrlist(__b, &v33, &v31, 0x14uLL, 0))
  {
    if (*__error() != 22)
    {
      v22 = __error();
      strerror(*v22);
      sub_206324734(CFSTR("%s:%d: getattrlist %s: %s\n"), v23, v24, v25, v26, v27, v28, v29, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/pathUtils.c");
      return 0;
    }
    bzero(&v35, 0x878uLL);
    if (statfs(a1, &v35))
    {
      v21 = __error();
      strerror(*v21);
      goto LABEL_21;
    }
    if (*(_DWORD *)v35.f_fstypename != 7562856)
      return 0;
  }
  else if ((BYTE6(v31) & 1) == 0)
  {
    return 0;
  }
  return 1;
}

int *sub_20632A6B8()
{
  timespec v0;
  int *result;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  stat v10;

  v0.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v0.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v10.st_blksize = v0;
  *(timespec *)v10.st_qspare = v0;
  v10.st_birthtimespec = v0;
  *(timespec *)&v10.st_size = v0;
  v10.st_mtimespec = v0;
  v10.st_ctimespec = v0;
  *(timespec *)&v10.st_uid = v0;
  v10.st_atimespec = v0;
  *(timespec *)&v10.st_dev = v0;
  result = (int *)stat("/", &v10);
  if ((_DWORD)result == -1)
  {
    v2 = __error();
    strerror(*v2);
    result = sub_206324734(CFSTR("%s:%d: stat /: %s\n"), v3, v4, v5, v6, v7, v8, v9, (char)"/Library/Caches/com.apple.xbs/Sources/AppleFSCompression/Common/pathUtils.c");
  }
  dword_2544F1258 = v10.st_dev;
  return result;
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB810](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
  MEMORY[0x24BDBB868](theArray, range.location, range.length, values);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x24BDBBA80](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x24BDBBA98](allocator, bundleURL);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1F0](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x24BDBC218](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x24BDBC230](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x24BDBC258](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x24BDBC3D0](theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x24BDBC3D8](allocator, values, numValues, callBacks);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x24BDBC590](alloc, buffer);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x24BDBC5A0](alloc, formatOptions, format, arguments);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x24BDBC5D0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x24BDBC650](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x24BDBC6A8](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x24BDBC6B0](theString, suffix);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC828](allocator, buffer, bufLen, isDirectory);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x24BDAD288](a1, *(_QWORD *)&a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB978](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_decode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB980](*(_QWORD *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB988](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_encode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB990](*(_QWORD *)&algorithm);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x24BDADEE0](queue);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x24BDADF60](object, queue);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

int dup(int a1)
{
  return MEMORY[0x24BDAE0B8](*(_QWORD *)&a1);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x24BDAE2B8](*(_QWORD *)&a1, a2);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x24BDAE358](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE388](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x24BDAE478](*(_QWORD *)&fd, name, *(_QWORD *)&options);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x24BDAE4D0](a1, a2, a3, *(_QWORD *)&a4);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE4F8](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x24BDAE518](*(_QWORD *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x24BDAE528](*(_QWORD *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x24BDAE548](*(_QWORD *)&a1, a2);
}

int futimes(int a1, const timeval *a2)
{
  return MEMORY[0x24BDAE588](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x24BDAE5A8](a1, a2, a3, a4, *(_QWORD *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

int getrlimit(int a1, rlimit *a2)
{
  return MEMORY[0x24BDAE730](*(_QWORD *)&a1, a2);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE798](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

uint64_t guarded_open_np()
{
  return MEMORY[0x24BDAE7D0]();
}

int isatty(int a1)
{
  return MEMORY[0x24BDAE8E0](*(_QWORD *)&a1);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEA20](a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAEB28](a1, a2);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAF698](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x24BDAF860](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x24BDAF888](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x24BDAF9A8](a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAFA00](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDAFAC0](a1, a2);
}

char *__cdecl rindex(const char *a1, int a2)
{
  return (char *)MEMORY[0x24BDAFBA8](a1, *(_QWORD *)&a2);
}

int setrlimit(int a1, const rlimit *a2)
{
  return MEMORY[0x24BDAFD60](*(_QWORD *)&a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x24BDAFEB0](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

int utimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x24BDB02F8](a1, a2);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0358](a1, a2, a3);
}

