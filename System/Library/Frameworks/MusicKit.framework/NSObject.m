@implementation NSObject

CFStringRef __68__NSObject_MusicKit_SoftLinking_MPIdentifierSet__musicKit_formerIDs__block_invoke(uint64_t a1, void *a2)
{
  uint64_t quot;
  uint64_t v3;
  UInt8 *v4;
  lldiv_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  quot = objc_msgSend(a2, "longLongValue");
  v3 = quot;
  v4 = (UInt8 *)&v8;
  do
  {
    v5 = lldiv(quot, 10);
    quot = v5.quot;
    if (v5.rem >= 0)
      LOBYTE(v6) = v5.rem;
    else
      v6 = -v5.rem;
    *v4-- = v6 + 48;
  }
  while (v5.quot);
  if (v3 < 0)
    *v4 = 45;
  else
    ++v4;
  return (id)CFStringCreateWithBytes(0, v4, (char *)&v9 - (char *)v4, 0x8000100u, 0);
}

void __91__NSObject_MusicKit_SoftLinking_MPArtworkCatalog__musicKit_requestImageDataWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void (*v8)(id);
  void *v9;
  void *v10;
  _Unwind_Exception *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = v5;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v8 = (void (*)(id))getUIImagePNGRepresentationSymbolLoc_ptr;
    v16 = getUIImagePNGRepresentationSymbolLoc_ptr;
    if (!getUIImagePNGRepresentationSymbolLoc_ptr)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __getUIImagePNGRepresentationSymbolLoc_block_invoke;
      v12[3] = &unk_24CD1CC68;
      v12[4] = &v13;
      __getUIImagePNGRepresentationSymbolLoc_block_invoke((uint64_t)v12);
      v8 = (void (*)(id))v14[3];
    }
    _Block_object_dispose(&v13, 8);
    if (!v8)
    {
      v11 = (_Unwind_Exception *)+[MusicKit_SoftLinking_MPModelLibrarySearchScope _topResultsRelationshipKeyForSpecificModelObjectType:].cold.1();
      _Block_object_dispose(&v13, 8);
      _Unwind_Resume(v11);
    }
    v8(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1308], -1017, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __102__NSObject_MusicKit_SoftLinking_MPArtworkCatalog__musicKit_requestColorAnalysisWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
