@implementation NTKVictoryTimeLabel

- (NTKVictoryTimeLabel)initWithTimeLabelOptions:(unint64_t)a3 forDevice:(id)a4 additionalPaddingInsets:(double)a5
{
  objc_super v6;

  self->_additionalPaddingInsets = a5;
  v6.receiver = self;
  v6.super_class = (Class)NTKVictoryTimeLabel;
  return -[NTKDigitalTimeLabel initWithTimeLabelOptions:forDevice:](&v6, sel_initWithTimeLabelOptions_forDevice_, a3, a4);
}

- (id)_newUnderlyingLabel:(BOOL)a3
{
  NTKVictoryLabel *v4;
  NTKVictoryLabel *v5;
  NSHashTable *labels;
  NSHashTable *v7;
  NSHashTable *v8;

  v4 = [NTKVictoryLabel alloc];
  v5 = -[CLKUIColoringLabel initWithFrame:options:](v4, "initWithFrame:options:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[NTKVictoryLabel setOutlineColor:](v5, "setOutlineColor:", self->_outlineColor);
  -[NTKVictoryLabel setOutlineAlpha:](v5, "setOutlineAlpha:", self->_outlineAlpha);
  -[NTKVictoryLabel setAdditionalPaddingInsets:](v5, "setAdditionalPaddingInsets:", self->_additionalPaddingInsets);
  labels = self->_labels;
  if (!labels)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v8 = self->_labels;
    self->_labels = v7;

    labels = self->_labels;
  }
  -[NSHashTable addObject:](labels, "addObject:", v5);
  return v5;
}

- (void)setOutlineColor:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  objc_storeStrong((id *)&self->_outlineColor, a3);
  -[NSHashTable allObjects](self->_labels, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__NTKVictoryTimeLabel_setOutlineColor___block_invoke;
  v8[3] = &unk_1E6BD2020;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

}

uint64_t __39__NTKVictoryTimeLabel_setOutlineColor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOutlineColor:", *(_QWORD *)(a1 + 32));
}

- (void)setOutlineAlpha:(double)a3
{
  id v4;
  _QWORD v5[5];

  self->_outlineAlpha = a3;
  -[NSHashTable allObjects](self->_labels, "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__NTKVictoryTimeLabel_setOutlineAlpha___block_invoke;
  v5[3] = &__block_descriptor_40_e32_v32__0__NTKVictoryLabel_8Q16_B24l;
  *(double *)&v5[4] = a3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

uint64_t __39__NTKVictoryTimeLabel_setOutlineAlpha___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOutlineAlpha:", *(double *)(a1 + 32));
}

- (UIColor)outlineColor
{
  return self->_outlineColor;
}

- (double)outlineAlpha
{
  return self->_outlineAlpha;
}

- (double)additionalPaddingInsets
{
  return self->_additionalPaddingInsets;
}

- (void)setAdditionalPaddingInsets:(double)a3
{
  self->_additionalPaddingInsets = a3;
}

- (NSHashTable)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
  objc_storeStrong((id *)&self->_labels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_outlineColor, 0);
}

@end
