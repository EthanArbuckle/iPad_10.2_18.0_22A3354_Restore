@implementation CallObjectPurgedCallback

void __figXPCConnection_CallObjectPurgedCallback_block_invoke(uint64_t a1)
{
  xpc_object_t array;
  int64_t int64;
  int64_t v4;
  size_t v5;
  void *uint64;
  id v7;
  const void *v8;
  const void *v9;

  array = xpc_dictionary_get_array(*(xpc_object_t *)(a1 + 32), ".ObjectIDs");
  int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), ".PurgeIdentifier");
  if (array)
  {
    v4 = int64;
    if (xpc_array_get_count(array))
    {
      v5 = 0;
      do
      {
        uint64 = (void *)xpc_array_get_uint64(array, v5);
        v7 = FigCFWeakReferenceTableCopyValue(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 112), uint64);
        if (v7)
        {
          v8 = v7;
          (*(void (**)(id, int64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 72))(v7, v4);
          CFRelease(v8);
        }
        ++v5;
      }
      while (v5 < xpc_array_get_count(array));
    }
  }
  FigXPCRelease(*(xpc_object_t *)(a1 + 32));
  v9 = *(const void **)(a1 + 40);
  if (v9)
    CFRelease(v9);
}

@end
