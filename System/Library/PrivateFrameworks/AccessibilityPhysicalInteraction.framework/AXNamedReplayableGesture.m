@implementation AXNamedReplayableGesture

void __96__AXNamedReplayableGesture_AXPIAdditions___tapGestureAtPoint_isDoubleTap_numberOfFingers_force___block_invoke(uint64_t a1, NSString *string, uint64_t a3)
{
  void *v5;
  CGPoint v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = (void *)MEMORY[0x24BDD1968];
  v6 = CGPointFromString(string);
  objc_msgSend(v5, "valueWithCGPoint:", v6.x, v6.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 48));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v11);

}

void __91__AXNamedReplayableGesture_AXPIAdditions__holdGestureAtPoint_withDuration_numberOfFingers___block_invoke(uint64_t a1, NSString *string, uint64_t a3)
{
  void *v5;
  CGPoint v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x24BDD1968];
  v6 = CGPointFromString(string);
  objc_msgSend(v5, "valueWithCGPoint:", v6.x, v6.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  v10 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_24F47C990, v11);

}

@end
