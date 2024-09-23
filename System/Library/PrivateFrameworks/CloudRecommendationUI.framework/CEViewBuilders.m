@implementation CEViewBuilders

+ (id)buildRecommendationFlowControllerWithAction:(id)a3
{
  id v3;
  id v4;

  v3 = objc_alloc_init((Class)objc_msgSend(a3, "detailControllerClass"));
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_2568F2970))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

@end
