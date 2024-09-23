@implementation AXLogWithThreshold

uint64_t ___AXLogWithThreshold_block_invoke()
{
  return objc_msgSend((id)_AXLogThresholdMap, "removeAllObjects");
}

void ___AXLogWithThreshold_block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v3 = v2;
  objc_msgSend((id)_AXLogThresholdMap, "objectForKey:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("repeatCount"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "unsignedIntegerValue") + 1;

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("time"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    v9 = v3 - v8;
    if (v3 - v8 >= *(double *)(a1 + 56))
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E28D55C8, CFSTR("repeatCount"), v9);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("time"));

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("repeatCount"));

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_1E28D55C8, CFSTR("repeatCount"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("time"));

    objc_msgSend((id)_AXLogThresholdMap, "setObject:forKey:", v11, *(_QWORD *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

  }
}

@end
