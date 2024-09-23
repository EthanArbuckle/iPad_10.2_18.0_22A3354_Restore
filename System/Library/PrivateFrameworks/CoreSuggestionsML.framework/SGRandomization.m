@implementation SGRandomization

+ (void)shuffleMutableArray:(id)a3 withRng:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  +[SGRandomization shuffleMutableArray:inRange:withRng:](SGRandomization, "shuffleMutableArray:inRange:withRng:", v6, 0, objc_msgSend(v6, "count"), v5);

}

+ (void)shuffleMutableArray:(id)a3 inRange:(_NSRange)a4 withRng:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  uint64_t i;
  unint64_t v12;
  void *v13;
  id v14;

  length = a4.length;
  location = a4.location;
  v14 = a3;
  v10 = a5;
  if (location + length > objc_msgSend(v14, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGRandomization.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NSMaxRange(range) <= mutableArray.count"));

  }
  if (length >= 2)
  {
    for (i = (location + length - 1); i > location; LODWORD(length) = length - 1)
    {
      if (v10)
        v12 = objc_msgSend(v10, "next") % (unint64_t)length;
      else
        v12 = arc4random_uniform(length);
      objc_msgSend(v14, "exchangeObjectAtIndex:withObjectAtIndex:", i--, v12 + location);
    }
  }

}

+ (void)shuffleMutableArray:(id)a3 inApproxEqualEpsilon:(double)a4 withValueBlock:(id)a5 withRng:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD *v23;
  uint64_t *v24;
  double v25;
  _QWORD v26[4];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGRandomization.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueBlock"));

  }
  if ((unint64_t)objc_msgSend(v11, "count") >= 2)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x2020000000;
    v26[3] = 0;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __83__SGRandomization_shuffleMutableArray_inApproxEqualEpsilon_withValueBlock_withRng___block_invoke;
    v19[3] = &unk_24DDC5360;
    v22 = v12;
    v23 = v26;
    v25 = a4;
    v24 = &v27;
    v14 = v11;
    v20 = v14;
    v15 = v13;
    v21 = v15;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v19);
    v16 = v28[3];
    v17 = objc_msgSend(v14, "count");
    +[SGRandomization shuffleMutableArray:inRange:withRng:](SGRandomization, "shuffleMutableArray:inRange:withRng:", v14, v16, v17 - v28[3], v15);

    _Block_object_dispose(v26, 8);
    _Block_object_dispose(&v27, 8);
  }

}

+ (id)shuffledSamplingWithoutReplacementForK:(unint64_t)a3 fromN:(unint64_t)a4 withRng:(id)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint32_t v14;
  unint64_t v15;
  void *v16;
  void *v18;

  v9 = a5;
  if (a3 > a4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGRandomization.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("k <= n"));

    v10 = (void *)objc_opt_new();
  }
  else
  {
    v10 = (void *)objc_opt_new();
    if (!a3)
      goto LABEL_5;
  }
  v11 = 0;
  do
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", v11);
    objc_msgSend(v10, "addObject:", v12);

    ++v11;
  }
  while (a3 != v11);
LABEL_5:
  objc_msgSend(a1, "shuffleMutableArray:withRng:", v10, v9);
  v13 = a3;
  if (a3 < a4)
  {
    v14 = a3 + 1;
    do
    {
      if (v9)
        v15 = objc_msgSend(v9, "next") % (unint64_t)v14;
      else
        v15 = arc4random_uniform(v14);
      if (v15 < a3)
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", v13);
        objc_msgSend(v10, "setObject:atIndexedSubscript:", v16, v15);

      }
      v13 = v14++;
    }
    while (v13 < a4);
  }

  return v10;
}

void __83__SGRandomization_shuffleMutableArray_inApproxEqualEpsilon_withValueBlock_withRng___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v5;
  double v6;
  uint64_t v7;

  v5 = (*(double (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v6 = v5;
  if (a3 && vabdd_f64(v5, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)) >= *(double *)(a1 + 72))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    +[SGRandomization shuffleMutableArray:inRange:withRng:](SGRandomization, "shuffleMutableArray:inRange:withRng:", *(_QWORD *)(a1 + 32), v7, a3 - v7, *(_QWORD *)(a1 + 40));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a3;
  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;
}

@end
