@implementation PHAudioCallViewControllerWrapper

- (ICSCallDisplayStyleHandler)viewController
{
  return (ICSCallDisplayStyleHandler *)sub_100152340();
}

- (PHAudioCallViewControllerWrapper)initWithCallDisplayStyleManager:(id)a3 callCenter:(id)a4 width:(double)a5 inCallRootViewController:(id)a6
{
  id v9;
  id v10;

  v9 = a3;
  v10 = a4;
  swift_unknownObjectRetain(a6);
  return (PHAudioCallViewControllerWrapper *)sub_100152350(v9, v10, (uint64_t)a6, a5);
}

- (PHAudioCallViewControllerWrapper)init
{
  sub_100152490();
}

- (void).cxx_destruct
{

}

@end
