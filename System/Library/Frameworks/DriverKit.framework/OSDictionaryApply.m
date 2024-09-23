@implementation OSDictionaryApply

uint64_t __OSDictionaryApply_block_invoke(uint64_t a1, uint64_t a2, OSSerialization *a3, OSMetaClassBase *anObject, uint64_t a5)
{
  OSMetaClassBase *v6;
  OSMetaClass *meta;
  _DWORD *v11;
  int v12;
  int v13;
  _DWORD *v14;

  v6 = anObject;
  if ((anObject & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) + 32) + 16 * a2) = OSCreateObjectFromSerializationInternal(a3, HIDWORD(anObject));
    v6 = *(OSMetaClassBase **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) + 32) + 16 * a2);
  }
  if (!OSMetaClassBase::safeMetaCast(v6, gOSStringMetaClass))
    __OSDictionaryApply_block_invoke_cold_1();
  if ((a5 & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) + 32) + 16 * a2 + 8) = OSCreateObjectFromSerializationInternal(a3, HIDWORD(a5));
    a5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) + 32) + 16 * a2 + 8);
  }
  if (!a5)
    __OSDictionaryApply_block_invoke_cold_2();
  meta = v6[1].meta;
  v12 = (int)meta->__vftable;
  v11 = (_DWORD *)&meta->__vftable + 1;
  v13 = v12 & 0x7E000000 | 0x1000000;
  if ((v12 & 0x7FFFFFFF) == 0x8000000)
    v11 = 0;
  if (v13 == 150994944)
    v14 = v11;
  else
    v14 = 0;
  return (*(uint64_t (**)(_QWORD, _DWORD *, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v14, a5);
}

void __OSDictionaryApply_block_invoke_cold_1()
{
  __assert_rtn("OSDictionaryApply_block_invoke", "OSCollections.cpp", 1010, "OSDynamicCast(OSString, key.object)");
}

void __OSDictionaryApply_block_invoke_cold_2()
{
  __assert_rtn("OSDictionaryApply_block_invoke", "OSCollections.cpp", 1017, "value.object");
}

@end
