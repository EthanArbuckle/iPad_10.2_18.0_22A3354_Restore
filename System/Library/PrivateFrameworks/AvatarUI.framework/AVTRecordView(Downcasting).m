@implementation AVTRecordView(Downcasting)

- (id)downcastWithAVTViewHandler:()Downcasting recordViewHandler:
{
  objc_super v5;

  if (a4)
    return (id)(*(uint64_t (**)(uint64_t, void *))(a4 + 16))(a4, a1);
  v5.receiver = a1;
  v5.super_class = (Class)&off_1F0404280;
  return objc_msgSendSuper2(&v5, sel_downcastWithAVTViewHandler_recordViewHandler_);
}

@end
