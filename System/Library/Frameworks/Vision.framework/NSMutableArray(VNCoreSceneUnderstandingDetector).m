@implementation NSMutableArray(VNCoreSceneUnderstandingDetector)

- (void)VNInsertObservationWithConfidence:()VNCoreSceneUnderstandingDetector limitedToN:providedByBlock:
{
  void (**v8)(void);
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  float v13;
  float v14;
  void (**v15)(void);

  v8 = a5;
  v15 = v8;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8[2]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "addObject:", v9);
LABEL_11:

    goto LABEL_12;
  }
  v10 = 0;
  v11 = objc_msgSend(a1, "count");
  if (v11)
  {
    while (1)
    {
      objc_msgSend(a1, "objectAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "confidence");
      v14 = v13;

      if (v14 < a2)
        break;
      if (v11 == ++v10)
      {
        v10 = v11;
        break;
      }
    }
  }
  if (v10 < a4)
  {
    v15[2]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == a4)
      objc_msgSend(a1, "removeObjectAtIndex:", a4 - 1);
    objc_msgSend(a1, "insertObject:atIndex:", v9, v10);
    goto LABEL_11;
  }
LABEL_12:

}

@end
