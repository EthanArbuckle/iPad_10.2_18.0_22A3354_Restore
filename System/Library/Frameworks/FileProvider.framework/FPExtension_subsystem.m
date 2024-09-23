@implementation FPExtension_subsystem

- (void)beginUsing:(id)a3 withBundle:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  FPExtension_subsystem *v11;
  SEL v12;

  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__FPExtension_subsystem_beginUsing_withBundle___block_invoke;
  block[3] = &unk_1E444B650;
  v11 = self;
  v12 = a2;
  v10 = v6;
  v7 = beginUsing_withBundle__onceToken;
  v8 = v6;
  if (v7 != -1)
    dispatch_once(&beginUsing_withBundle__onceToken, block);

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__FPExtension_subsystem_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once_2 != -1)
    dispatch_once(&sharedInstance_once_2, block);
  return (id)sharedInstance___instance;
}

@end
