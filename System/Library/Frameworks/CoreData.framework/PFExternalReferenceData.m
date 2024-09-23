@implementation PFExternalReferenceData

BOOL __46___PFExternalReferenceData__attemptToMapData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  _BOOL8 result;
  uint64_t v6;

  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "stringByDeletingLastPathComponent");
  v6 = 0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v4) & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v6);
  result = +[_PFRoutines createExternalReferenceLinkFromPath:toPath:protectionLevel:error:]((uint64_t)_PFRoutines, objc_msgSend(a2, "path"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), objc_msgSend(*(id *)(a1 + 32), "preferredProtectionLevel"), &v6);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
