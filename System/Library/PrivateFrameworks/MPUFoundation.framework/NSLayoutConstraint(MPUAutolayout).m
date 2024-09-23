@implementation NSLayoutConstraint(MPUAutolayout)

+ (id)constraintsByCenteringView:()MPUAutolayout withView:alongAxes:offset:
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 9, 0, v12, 9, 1.0, a1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

  }
  if ((a7 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 10, 0, v12, 10, 1.0, a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v15);

  }
  return v13;
}

+ (id)constraintsByAttachingView:()MPUAutolayout toView:alongEdges:insets:
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;

  v15 = a7;
  v16 = a8;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 3, 0, v16, 3, 1.0, a1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v20);

    if ((a9 & 4) == 0)
    {
LABEL_3:
      if ((a9 & 2) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 5, 0, v16, 5, 1.0, a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v22);

      if ((a9 & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((a9 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 4, 0, v16, 4, 1.0, -a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObject:", v21);

  if ((a9 & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((a9 & 8) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 6, 0, v16, 6, 1.0, -a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v18);

  }
LABEL_6:

  return v17;
}

+ (id)constraintsByCenteringAndContainingView:()MPUAutolayout inView:insets:
{
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;

  v13 = (void *)MEMORY[0x24BDBCEB8];
  v14 = a8;
  v15 = a7;
  objc_msgSend(v13, "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 9, 0, v14, 9, 1.0, (a2 - a4) * 0.5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v17);
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 10, 0, v14, 10, 1.0, (a1 - a3) * 0.5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v18);
  v19 = -(a2 + a4);
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 7, -1, v14, 7, 1.0, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v20);
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 7, 0, v14, 7, 1.0, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = 1144750080;
  objc_msgSend(v21, "setPriority:", v22);
  objc_msgSend(v16, "addObject:", v21);
  v23 = -(a1 + a3);
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 8, -1, v14, 8, 1.0, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v24);
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 8, 0, v14, 8, 1.0, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v26) = 1144750080;
  objc_msgSend(v25, "setPriority:", v26);
  objc_msgSend(v16, "addObject:", v25);

  return v16;
}

+ (id)constraintsByAttachingView:()MPUAutolayout toView:inCorner:offset:
{
  double v7;
  double v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v7 = a2;
  v8 = a1;
  v19[2] = *MEMORY[0x24BDAC8D0];
  v10 = 5;
  v11 = 3;
  switch(a7)
  {
    case 1:
      break;
    case 2:
      v8 = -a1;
      v10 = 6;
      v11 = 3;
      break;
    case 4:
      v7 = -a2;
      v10 = 5;
      goto LABEL_6;
    case 8:
      v8 = -a1;
      v7 = -a2;
      v10 = 6;
LABEL_6:
      v11 = 4;
      break;
    default:
      v11 = 0;
      v10 = 0;
      break;
  }
  v12 = (void *)MEMORY[0x24BDD1628];
  v13 = a6;
  v14 = a5;
  objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 9, 0, v13, v10, 1.0, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 10, 0, v13, v11, 1.0, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v15;
  v19[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)constraintsBySizingView:()MPUAutolayout toSize:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1 != -1.0)
  {
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 7, 0, 0, 0, 1.0, a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
  if (a2 != -1.0)
  {
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7, 8, 0, 0, 0, 1.0, a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

  }
  return v8;
}

@end
