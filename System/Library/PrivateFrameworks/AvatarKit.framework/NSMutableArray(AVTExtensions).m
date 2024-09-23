@implementation NSMutableArray(AVTExtensions)

- (void)avt_applyPoseRoundingBehaviour
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  id v7;

  _AVTPoseRoundingBehaviour();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(a1, "count");
  if (v2)
  {
    v3 = v2;
    for (i = 0; i != v3; ++i)
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "avt_numberByRoundingWithBehavior:", v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setObject:atIndexedSubscript:", v6, i);

      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "avt_applyPoseRoundingBehaviour");
      }

    }
  }

}

@end
