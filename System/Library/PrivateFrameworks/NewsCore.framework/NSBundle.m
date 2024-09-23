@implementation NSBundle

void __71__NSBundle_FeldsparInternalExtras__fc_feldsparCoreInternalExtrasBundle__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0CB34D0]);
  FCURLForInternalExtrasBundle();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithPath:", v1);
  v3 = (void *)qword_1ED0F84B8;
  qword_1ED0F84B8 = v2;

}

@end
