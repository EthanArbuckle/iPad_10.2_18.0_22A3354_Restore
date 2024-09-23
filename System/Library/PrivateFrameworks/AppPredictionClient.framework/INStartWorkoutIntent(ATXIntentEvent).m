@implementation INStartWorkoutIntent(ATXIntentEvent)

- (void)atx_getArgsInto:()ATXIntentEvent
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  int v14;

  v4 = a3;
  objc_msgSend(a1, "workoutName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spokenPhrase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setArg1:", v6);

  objc_msgSend(a1, "goalValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3598];
    objc_msgSend(a1, "goalValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "decimalValue");
    }
    else
    {
      v13[0] = 0;
      v13[1] = 0;
      v14 = 0;
    }
    objc_msgSend(v8, "decimalNumberWithDecimal:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    roundedDecimal(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setArg2:", v12);

  }
}

@end
