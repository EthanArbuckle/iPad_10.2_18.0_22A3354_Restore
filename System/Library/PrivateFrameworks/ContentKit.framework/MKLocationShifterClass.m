@implementation MKLocationShifterClass

Class __get_MKLocationShifterClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!MapKitLibraryCore_frameworkLibrary_11697)
    MapKitLibraryCore_frameworkLibrary_11697 = _sl_dlopen();
  if (!MapKitLibraryCore_frameworkLibrary_11697)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MapKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("DCMapsLink+WFLocationCoercions.m"), 14, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("_MKLocationShifter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class get_MKLocationShifterClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("DCMapsLink+WFLocationCoercions.m"), 15, CFSTR("Unable to find class %s"), "_MKLocationShifter");

LABEL_8:
    __break(1u);
  }
  get_MKLocationShifterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
