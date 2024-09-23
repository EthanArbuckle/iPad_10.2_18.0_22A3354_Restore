@implementation PKFakeDisableDelegate

+ (id)_infoInProcess
{
  if (qword_1ECEE6588 != -1)
    dispatch_once(&qword_1ECEE6588, &__block_literal_global_142);
  return (id)qword_1ECEE6580;
}

void __39__PKFakeDisableDelegate__infoInProcess__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, 10);
  v1 = (void *)qword_1ECEE6578;
  qword_1ECEE6578 = v0;

  v2 = (void *)qword_1ECEE6578;
  +[_PKFakeFixInfo disableInfoWithInteractionValue:](_PKFakeFixInfo, "disableInfoWithInteractionValue:", 0xBE3DE77E1BA5CA28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, 0xD6014EA89BD82C72);

  v4 = (void *)qword_1ECEE6578;
  +[_PKFakeFixInfo disableInfoWithInteractionValue:](_PKFakeFixInfo, "disableInfoWithInteractionValue:", 0xBE3DE77E1BA5CA28);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, 0x55AFCEEEBCB7DC0CLL);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)qword_1ECEE6578, "objectForKey:", objc_msgSend(v9, "hash"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_1ECEE6580;
  qword_1ECEE6580 = v7;

}

+ (BOOL)_shouldAttachForView:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  if (v4 && (dyld_program_sdk_at_least() & 1) == 0)
  {
    objc_msgSend(a1, "_infoInProcess");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "interactionValue"))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "hash");
      v5 = v9 == objc_msgSend(v6, "interactionValue");

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  return 0;
}

@end
