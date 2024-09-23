id sub_226B37D78()
{
  void *v0;

  return objc_msgSend(v0, sel_databaseScope);
}

id sub_226B37D88@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_databaseScope);
  *a2 = result;
  return result;
}

id sub_226B37DB8(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDatabaseScope_, *a1);
}

id sub_226B37DCC(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, sel_setDatabaseScope_, a1);
}

_QWORD *(*sub_226B37DE0(uint64_t a1))(_QWORD *result, char a2)
{
  void *v1;

  *(_QWORD *)(a1 + 16) = v1;
  *(_QWORD *)a1 = objc_msgSend(v1, sel_databaseScope);
  *(_BYTE *)(a1 + 8) = 0;
  return sub_226B37E24;
}

_QWORD *sub_226B37E24(_QWORD *result, char a2)
{
  char v2;

  v2 = *((_BYTE *)result + 8);
  if ((a2 & 1) != 0)
  {
    if ((result[1] & 1) == 0)
      return objc_msgSend((id)result[2], sel_setDatabaseScope_, *result);
    __break(1u);
  }
  if ((v2 & 1) == 0)
    return objc_msgSend((id)result[2], sel_setDatabaseScope_, *result);
  __break(1u);
  return result;
}

id NSPersistentCloudKitContainerOptions.databaseScope.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_databaseScope);
}

id NSPersistentCloudKitContainerOptions.databaseScope.setter(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, sel_setDatabaseScope_, a1);
}

void (*NSPersistentCloudKitContainerOptions.databaseScope.modify(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_226B37DE0((uint64_t)v2);
  return sub_226B37EBC;
}

void sub_226B37EBC(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

