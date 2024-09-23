@implementation AutoBugCaptureHelper

- (void)reportWithDomain:(id)a3 type:(id)a4 subtype:(id)a5 subtypeContext:(id)a6
{
  AutoBugCaptureHelper *v7;

  sub_2375EC224();
  sub_2375EC224();
  sub_2375EC224();
  sub_2375EC224();
  v7 = self;
  sub_2375BC138();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (AutoBugCaptureHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AutoBugCaptureHelper;
  return -[AutoBugCaptureHelper init](&v3, sel_init);
}

@end
