@implementation FBK_EXHostViewControllerDelegateWrapper

- (void)hostViewController:(id)a3 didBeginHosting:(id)a4
{
  id v6;
  id v7;
  _TtC8FeedbackP33_EE21497D76FC0771846C2AC1D57947B539FBK_EXHostViewControllerDelegateWrapper *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22DDC0F04();

}

- (void)hostViewController:(id)a3 didFailToHost:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC8FeedbackP33_EE21497D76FC0771846C2AC1D57947B539FBK_EXHostViewControllerDelegateWrapper *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_22DDC1014(a5);

}

- (_TtC8FeedbackP33_EE21497D76FC0771846C2AC1D57947B539FBK_EXHostViewControllerDelegateWrapper)init
{
  _TtC8FeedbackP33_EE21497D76FC0771846C2AC1D57947B539FBK_EXHostViewControllerDelegateWrapper *result;

  result = (_TtC8FeedbackP33_EE21497D76FC0771846C2AC1D57947B539FBK_EXHostViewControllerDelegateWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
