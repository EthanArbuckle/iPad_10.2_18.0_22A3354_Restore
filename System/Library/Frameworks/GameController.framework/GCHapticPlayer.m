@implementation GCHapticPlayer

uint64_t __35___GCHapticPlayer_scheduleCommand___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "time");
  v7 = v6;
  objc_msgSend(v5, "time");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "time");
    v11 = v10;
    objc_msgSend(v5, "time");
    if (v11 <= v12)
      v9 = 0;
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

@end
