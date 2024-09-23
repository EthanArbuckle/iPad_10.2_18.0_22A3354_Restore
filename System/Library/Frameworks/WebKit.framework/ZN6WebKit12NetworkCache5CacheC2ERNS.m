@implementation ZN6WebKit12NetworkCache5CacheC2ERNS

WTF::StringImpl *___ZN6WebKit12NetworkCache5CacheC2ERNS_14NetworkProcessERKN3WTF6StringEONS4_3RefINS0_7StorageENS4_12RawPtrTraitsIS9_EENS4_21DefaultRefDerefTraitsIS9_EEEENS4_9OptionSetINS0_11CacheOptionEEEN3PAL9SessionIDE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  WTF::StringImpl *v2;
  int v3;
  WTF::StringImpl *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8[2];
  _BYTE v9[20];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  WebKit::NetworkCache::Cache::dumpFilePath((WebKit::NetworkCache::Storage **)v1);
  v3 = WTF::FileSystemImpl::openFile();
  result = *(WTF::StringImpl **)v9;
  *(_QWORD *)v9 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2)
      result = (WTF::StringImpl *)WTF::StringImpl::destroy(result, v2);
    else
      *(_DWORD *)result -= 2;
  }
  if (v3 != -1)
  {
    WTF::FileSystemImpl::writeToFile();
    *(_OWORD *)&v9[4] = 0uLL;
    v5 = *(_QWORD *)(v1 + 8);
    v6 = *(_QWORD *)(v5 + 40);
    {
      v8[0] = (uint64_t)"Resource";
      v8[1] = 9;
      WTF::NeverDestroyed<WTF::AtomString const,WTF::AnyThreadsAccessTraits>::NeverDestroyed<WTF::ASCIILiteral>(&WebKit::NetworkCache::resourceType(void)::resource, (uint64_t)v8);
    }
    v7 = WTF::fastMalloc((WTF *)0x30);
    *(_QWORD *)v7 = off_1E34C4310;
    *(_DWORD *)(v7 + 8) = v3;
    *(_DWORD *)(v7 + 16) = 0;
    *(_OWORD *)(v7 + 20) = *(_OWORD *)v9;
    *(_DWORD *)(v7 + 36) = *(_DWORD *)&v9[16];
    *(_QWORD *)(v7 + 40) = v6;
    v8[0] = v7;
    WebKit::NetworkCache::Storage::traverse(v5, &WebKit::NetworkCache::resourceType(void)::resource, 3, v8);
    result = (WTF::StringImpl *)v8[0];
    if (v8[0])
      return (WTF::StringImpl *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v8[0] + 8))(v8[0]);
  }
  return result;
}

@end
