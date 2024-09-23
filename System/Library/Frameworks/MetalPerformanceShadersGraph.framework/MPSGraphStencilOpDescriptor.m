@implementation MPSGraphStencilOpDescriptor

+ (MPSGraphStencilOpDescriptor)descriptorWithReductionMode:(MPSGraphReductionMode)reductionMode offsets:(MPSShape *)offsets strides:(MPSShape *)strides dilationRates:(MPSShape *)dilationRates explicitPadding:(MPSShape *)explicitPadding boundaryMode:(MPSGraphPaddingMode)boundaryMode paddingStyle:(MPSGraphPaddingStyle)paddingStyle paddingConstant:(float)paddingConstant
{
  MPSShape *v16;
  MPSShape *v17;
  MPSShape *v18;
  MPSShape *v19;
  MPSGraphStencilOpDescriptor *v20;
  double v21;

  v16 = offsets;
  v17 = strides;
  v18 = dilationRates;
  v19 = explicitPadding;
  v20 = objc_alloc_init(MPSGraphStencilOpDescriptor);
  -[MPSGraphStencilOpDescriptor setReductionMode:](v20, "setReductionMode:", reductionMode);
  -[MPSGraphStencilOpDescriptor setOffsets:](v20, "setOffsets:", v16);
  -[MPSGraphStencilOpDescriptor setStrides:](v20, "setStrides:", v17);
  -[MPSGraphStencilOpDescriptor setDilationRates:](v20, "setDilationRates:", v18);
  -[MPSGraphStencilOpDescriptor setExplicitPadding:](v20, "setExplicitPadding:", v19);
  -[MPSGraphStencilOpDescriptor setBoundaryMode:](v20, "setBoundaryMode:", boundaryMode);
  -[MPSGraphStencilOpDescriptor setPaddingStyle:](v20, "setPaddingStyle:", paddingStyle);
  *(float *)&v21 = paddingConstant;
  -[MPSGraphStencilOpDescriptor setPaddingConstant:](v20, "setPaddingConstant:", v21);

  return v20;
}

+ (MPSGraphStencilOpDescriptor)descriptorWithOffsets:(MPSShape *)offsets explicitPadding:(MPSShape *)explicitPadding
{
  double v4;

  LODWORD(v4) = 0;
  +[MPSGraphStencilOpDescriptor descriptorWithReductionMode:offsets:strides:dilationRates:explicitPadding:boundaryMode:paddingStyle:paddingConstant:](MPSGraphStencilOpDescriptor, "descriptorWithReductionMode:offsets:strides:dilationRates:explicitPadding:boundaryMode:paddingStyle:paddingConstant:", 2, offsets, &unk_1E0E9B410, &unk_1E0E9B428, explicitPadding, 4, v4, 3);
  return (MPSGraphStencilOpDescriptor *)(id)objc_claimAutoreleasedReturnValue();
}

+ (MPSGraphStencilOpDescriptor)descriptorWithExplicitPadding:(MPSShape *)explicitPadding
{
  double v3;

  LODWORD(v3) = 0;
  +[MPSGraphStencilOpDescriptor descriptorWithReductionMode:offsets:strides:dilationRates:explicitPadding:boundaryMode:paddingStyle:paddingConstant:](MPSGraphStencilOpDescriptor, "descriptorWithReductionMode:offsets:strides:dilationRates:explicitPadding:boundaryMode:paddingStyle:paddingConstant:", 2, &unk_1E0E9B440, &unk_1E0E9B458, &unk_1E0E9B470, explicitPadding, 4, v3, 0);
  return (MPSGraphStencilOpDescriptor *)(id)objc_claimAutoreleasedReturnValue();
}

+ (MPSGraphStencilOpDescriptor)descriptorWithPaddingStyle:(MPSGraphPaddingStyle)paddingStyle
{
  double v3;

  LODWORD(v3) = 0;
  return +[MPSGraphStencilOpDescriptor descriptorWithReductionMode:offsets:strides:dilationRates:explicitPadding:boundaryMode:paddingStyle:paddingConstant:](MPSGraphStencilOpDescriptor, "descriptorWithReductionMode:offsets:strides:dilationRates:explicitPadding:boundaryMode:paddingStyle:paddingConstant:", 2, &unk_1E0E9B488, &unk_1E0E9B4A0, &unk_1E0E9B4B8, &unk_1E0E9B4D0, 4, v3, paddingStyle);
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPSGraphStencilOpDescriptor *v4;
  double v5;

  v4 = [MPSGraphStencilOpDescriptor alloc];
  -[MPSGraphStencilOpDescriptor setReductionMode:](v4, "setReductionMode:", self->_reductionMode);
  -[MPSGraphStencilOpDescriptor setOffsets:](v4, "setOffsets:", self->_offsets);
  -[MPSGraphStencilOpDescriptor setStrides:](v4, "setStrides:", self->_strides);
  -[MPSGraphStencilOpDescriptor setDilationRates:](v4, "setDilationRates:", self->_dilationRates);
  -[MPSGraphStencilOpDescriptor setExplicitPadding:](v4, "setExplicitPadding:", self->_explicitPadding);
  -[MPSGraphStencilOpDescriptor setBoundaryMode:](v4, "setBoundaryMode:", self->_boundaryMode);
  -[MPSGraphStencilOpDescriptor setPaddingStyle:](v4, "setPaddingStyle:", self->_paddingStyle);
  *(float *)&v5 = self->_paddingConstant;
  -[MPSGraphStencilOpDescriptor setPaddingConstant:](v4, "setPaddingConstant:", v5);
  return v4;
}

- (MPSGraphReductionMode)reductionMode
{
  return self->_reductionMode;
}

- (void)setReductionMode:(MPSGraphReductionMode)reductionMode
{
  self->_reductionMode = reductionMode;
}

- (MPSShape)offsets
{
  return self->_offsets;
}

- (void)setOffsets:(MPSShape *)offsets
{
  objc_setProperty_nonatomic_copy(self, a2, offsets, 24);
}

- (MPSShape)strides
{
  return self->_strides;
}

- (void)setStrides:(MPSShape *)strides
{
  objc_setProperty_nonatomic_copy(self, a2, strides, 32);
}

- (MPSShape)dilationRates
{
  return self->_dilationRates;
}

- (void)setDilationRates:(MPSShape *)dilationRates
{
  objc_setProperty_nonatomic_copy(self, a2, dilationRates, 40);
}

- (MPSShape)explicitPadding
{
  return self->_explicitPadding;
}

- (void)setExplicitPadding:(MPSShape *)explicitPadding
{
  objc_setProperty_nonatomic_copy(self, a2, explicitPadding, 48);
}

- (MPSGraphPaddingMode)boundaryMode
{
  return self->_boundaryMode;
}

- (void)setBoundaryMode:(MPSGraphPaddingMode)boundaryMode
{
  self->_boundaryMode = boundaryMode;
}

- (MPSGraphPaddingStyle)paddingStyle
{
  return self->_paddingStyle;
}

- (void)setPaddingStyle:(MPSGraphPaddingStyle)paddingStyle
{
  self->_paddingStyle = paddingStyle;
}

- (float)paddingConstant
{
  return self->_paddingConstant;
}

- (void)setPaddingConstant:(float)paddingConstant
{
  self->_paddingConstant = paddingConstant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explicitPadding, 0);
  objc_storeStrong((id *)&self->_dilationRates, 0);
  objc_storeStrong((id *)&self->_strides, 0);
  objc_storeStrong((id *)&self->_offsets, 0);
}

@end
