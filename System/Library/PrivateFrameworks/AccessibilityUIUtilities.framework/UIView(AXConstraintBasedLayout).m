@implementation UIView(AXConstraintBasedLayout)

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToConstant:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToConstant:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToConstant:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToConstant:priority:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToValueOfView:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToValueOfView:priority:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:withOffset:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToValueOfView:withOffset:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:withOffset:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToValueOfView:withOffset:priority:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToLayoutAttribute:ofView:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofView:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToLayoutAttribute:ofView:withOffset:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofView:withOffset:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToLayoutAttribute:ofView:withOffset:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofView:withOffset:priority:");
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToConstant:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 0, 0, 0, 1.0, a4);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToConstant:priority:
{
  *(float *)&a6 = a5;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:", a3, 0, 0, 0, 1.0, a4, a6);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToValueOfView:withOffset:", 0.0);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:priority:
{
  *(float *)&a4 = a3;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToValueOfView:withOffset:priority:", 0.0, a4);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:withOffset:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofView:withOffset:", a3, a3, a4);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:withOffset:priority:
{
  *(float *)&a7 = a6;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:", a3, 0, a4, a3, 1.0, a5, a7);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToLayoutAttribute:ofView:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofView:withOffset:", 0.0);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToLayoutAttribute:ofView:withOffset:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 0, a5, a4, 1.0, a6);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToLayoutAttribute:ofView:withOffset:priority:
{
  *(float *)&a8 = a7;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:", a3, 0, a5, a4, 1.0, a6, a8);
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToConstant:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asLessThanOrEqualToConstant:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToConstant:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asLessThanOrEqualToConstant:priority:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToValueOfView:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asLessThanOrEqualToValueOfView:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToValueOfView:withOffset:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asLessThanOrEqualToValueOfView:withOffset:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToValueOfView:withOffset:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asLessThanOrEqualToValueOfView:withOffset:priority:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToLayoutAttribute:ofView:withOffset:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asLessThanOrEqualToLayoutAttribute:ofView:withOffset:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToLayoutAttribute:ofView:withOffset:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asLessThanOrEqualToLayoutAttribute:ofView:withOffset:priority:");
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToConstant:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, -1, 0, 0, 1.0, a4);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToConstant:priority:
{
  *(float *)&a6 = a5;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:", a3, -1, 0, 0, 1.0, a4, a6);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToValueOfView:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asLessThanOrEqualToValueOfView:withOffset:", 0.0);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToValueOfView:withOffset:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, -1, a4, a3, 1.0, a5);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToValueOfView:withOffset:priority:
{
  *(float *)&a7 = a6;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:", a3, -1, a4, a3, 1.0, a5, a7);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToLayoutAttribute:ofView:withOffset:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, -1, a5, a4, 1.0, a6);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToLayoutAttribute:ofView:withOffset:priority:
{
  *(float *)&a8 = a7;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:", a3, -1, a5, a4, 1.0, a6, a8);
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToConstant:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asGreaterThanOrEqualToConstant:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToConstant:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asGreaterThanOrEqualToConstant:priority:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToValueOfView:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asGreaterThanOrEqualToValueOfView:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToValueOfView:withOffset:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asGreaterThanOrEqualToValueOfView:withOffset:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToValueOfView:withOffset:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asGreaterThanOrEqualToValueOfView:withOffset:priority:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToLayoutAttribute:ofView:withOffset:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asGreaterThanOrEqualToLayoutAttribute:ofView:withOffset:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToLayoutAttribute:ofView:withOffset:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asGreaterThanOrEqualToLayoutAttribute:ofView:withOffset:priority:");
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToConstant:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 1, 0, 0, 1.0, a4);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToConstant:priority:
{
  *(float *)&a6 = a5;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:", a3, 1, 0, 0, 1.0, a4, a6);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToValueOfView:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asGreaterThanOrEqualToValueOfView:withOffset:", 0.0);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToValueOfView:withOffset:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 1, a4, a3, 1.0, a5);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToValueOfView:withOffset:priority:
{
  *(float *)&a7 = a6;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:", a3, 1, a4, a3, 1.0, a5, a7);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToLayoutAttribute:ofView:withOffset:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 1, a5, a4, 1.0, a6);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToLayoutAttribute:ofView:withOffset:priority:
{
  *(float *)&a8 = a7;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:", a3, 1, a5, a4, 1.0, a6, a8);
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout relatedBy:toItem:attribute:multiplier:constant:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout relatedBy:toItem:attribute:multiplier:constant:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:");
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout relatedBy:toItem:attribute:multiplier:constant:
{
  LODWORD(a5) = 1148846080;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:", a3, a4, a5);
}

- (id)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout relatedBy:toItem:attribute:multiplier:constant:priority:
{
  id v16;
  void *v17;
  double v18;
  void *v19;

  v16 = a8;
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a1, a6, a7, v16, a9, a2, a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v18 = a4;
  objc_msgSend(v17, "setPriority:", v18);
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "ax_firstCommonAncestorWithView:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addConstraint:", v17);

    }
    else
    {
      objc_msgSend(a1, "addConstraint:", v17);
    }
  }

  return v17;
}

- (uint64_t)_ax_depth
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = a1;
  if (!v1)
    return -1;
  v2 = v1;
  v3 = -1;
  do
  {
    objc_msgSend(v2, "superview");
    v4 = objc_claimAutoreleasedReturnValue();

    ++v3;
    v2 = (void *)v4;
  }
  while (v4);
  return v3;
}

- (id)ax_firstCommonAncestorWithView:()AXConstraintBasedLayout
{
  id v4;
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = a1;
  v6 = v4;
  v7 = objc_msgSend(v5, "_ax_depth");
  v8 = objc_msgSend(v6, "_ax_depth");
  if (v8 < v7)
    v9 = v8;
  else
    v9 = v7;
  if (v8 < v7)
    v10 = v7;
  else
    v10 = v8;
  if (v8 < v7)
    v11 = v5;
  else
    v11 = v6;
  if (v8 < v7)
    v12 = v6;
  else
    v12 = v5;
  if (v9 >= v10)
  {
    v13 = v11;
  }
  else
  {
    do
    {
      objc_msgSend(v11, "superview");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      --v10;
      v11 = v13;
    }
    while (v9 < v10);
  }
  v14 = 0;
  if (v12 && v13)
  {
    while (v12 != v13)
    {
      objc_msgSend(v12, "superview");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "superview");
      v16 = (id)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      if (v15)
      {
        v12 = v15;
        v13 = v16;
        if (v16)
          continue;
      }
      goto LABEL_25;
    }
    v16 = v12;
    v15 = v16;
    v14 = v16;
  }
  else
  {
    v16 = v13;
    v15 = v12;
  }
LABEL_25:

  return v14;
}

- (id)ax_pinConstraintsInAllDimensionsToView:()AXConstraintBasedLayout
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "arrayWithCapacity:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofView:", 3, 3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofView:", 2, 2, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v8);

  objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofView:", 4, 4, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofView:", 1, 1, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v10);
  return v6;
}

- (void)ax_setContentHuggingAndCompressionResistance:()AXConstraintBasedLayout
{
  void *v8;
  float v9;

  v8 = result;
  v9 = *(float *)&AXLayoutPriorityIgnored;
  if (*(float *)&a2 > *(float *)&AXLayoutPriorityIgnored)
  {
    result = (void *)objc_msgSend(result, "setContentHuggingPriority:forAxis:", 0);
    v9 = *(float *)&AXLayoutPriorityIgnored;
  }
  if (a3 > v9)
  {
    *(float *)&a2 = a3;
    result = (void *)objc_msgSend(v8, "setContentHuggingPriority:forAxis:", 1, a2);
    v9 = *(float *)&AXLayoutPriorityIgnored;
  }
  if (a4 > v9)
  {
    *(float *)&a2 = a4;
    result = (void *)objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 0, a2);
    v9 = *(float *)&AXLayoutPriorityIgnored;
  }
  if (a5 > v9)
  {
    *(float *)&a2 = a4;
    return (void *)objc_msgSend(v8, "setContentCompressionResistancePriority:forAxis:", 1, a2);
  }
  return result;
}

@end
