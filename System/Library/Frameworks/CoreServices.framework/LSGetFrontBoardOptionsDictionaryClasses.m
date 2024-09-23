@implementation LSGetFrontBoardOptionsDictionaryClasses

void ___LSGetFrontBoardOptionsDictionaryClasses_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Class UISPasteSharingTokenClass;
  uint64_t v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  XNSGetPropertyListClasses();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setByAddingObjectsFromArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_LSGetFrontBoardOptionsDictionaryClasses_result;
  _LSGetFrontBoardOptionsDictionaryClasses_result = v2;

  v4 = getBSServiceConnectionEndpointClass[0]();
  if (v4)
  {
    objc_msgSend((id)_LSGetFrontBoardOptionsDictionaryClasses_result, "setByAddingObject:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)_LSGetFrontBoardOptionsDictionaryClasses_result;
    _LSGetFrontBoardOptionsDictionaryClasses_result = v5;

  }
  v7 = getUISClickAttributionClass[0]();
  if (v7)
  {
    objc_msgSend((id)_LSGetFrontBoardOptionsDictionaryClasses_result, "setByAddingObject:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)_LSGetFrontBoardOptionsDictionaryClasses_result;
    _LSGetFrontBoardOptionsDictionaryClasses_result = v8;

  }
  UISPasteSharingTokenClass = getUISPasteSharingTokenClass();
  if (UISPasteSharingTokenClass)
  {
    objc_msgSend((id)_LSGetFrontBoardOptionsDictionaryClasses_result, "setByAddingObject:", UISPasteSharingTokenClass);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)_LSGetFrontBoardOptionsDictionaryClasses_result;
    _LSGetFrontBoardOptionsDictionaryClasses_result = v11;

  }
}

@end
