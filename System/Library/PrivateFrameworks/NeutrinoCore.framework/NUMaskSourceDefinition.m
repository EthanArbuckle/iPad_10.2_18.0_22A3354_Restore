@implementation NUMaskSourceDefinition

- (NUMaskSourceDefinition)initWithCIImage:(id)a3 croppedExtent:(id *)a4 scale:(id)a5 orientation:(int64_t)a6
{
  int64_t var1;
  int64_t var0;
  NUMaskSourceDefinition *result;
  $0AC6E346AE4835514AAA8AC86D8F4844 v10;
  objc_super v11;

  var1 = a5.var1;
  var0 = a5.var0;
  v11.receiver = self;
  v11.super_class = (Class)NUMaskSourceDefinition;
  result = -[NUCIImageSourceDefinition initWithCIImage:orientation:](&v11, sel_initWithCIImage_orientation_, a3, a6);
  v10 = a4->var1;
  result->_croppedExtent.origin = ($86B46DF249C2B4242DBB096758D29184)a4->var0;
  result->_croppedExtent.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)v10;
  result->_scale.numerator = var0;
  result->_scale.denominator = var1;
  return result;
}

- (id)generateSourceNodeWithIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  NUMaskSourceNode *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NUMaskSourceNode *v10;
  void *v11;
  uint64_t v13;

  v5 = a3;
  v6 = [NUMaskSourceNode alloc];
  -[NUCIImageSourceDefinition image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUMaskSourceDefinition croppedExtent](self, "croppedExtent");
  v8 = -[NUMaskSourceDefinition scale](self, "scale");
  v10 = -[NUMaskSourceNode initWithImage:croppedExtent:scale:identifier:orientation:](v6, "initWithImage:croppedExtent:scale:identifier:orientation:", v7, &v13, v8, v9, v5, -[NUCIImageSourceDefinition orientation](self, "orientation"));

  -[NUSingleSourceDefinition sourceDerivation](self, "sourceDerivation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUSourceNode setSourceDerivation:](v10, "setSourceDerivation:", v11);

  return v10;
}

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)croppedExtent
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3;

  v3 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[2].var0.var1;
  retstr->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[1].var1.var1;
  retstr->var1 = v3;
  return self;
}

- (void)setCroppedExtent:(id *)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;

  var1 = a3->var1;
  self->_croppedExtent.origin = ($86B46DF249C2B4242DBB096758D29184)a3->var0;
  self->_croppedExtent.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)var1;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scale
{
  $F9703ADC4DD3124DE91DE417D7636CC9 *p_scale;
  int64_t numerator;
  int64_t denominator;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_scale = &self->_scale;
  numerator = self->_scale.numerator;
  denominator = p_scale->denominator;
  result.var1 = denominator;
  result.var0 = numerator;
  return result;
}

- (void)setScale:(id)a3
{
  self->_scale = ($F9703ADC4DD3124DE91DE417D7636CC9)a3;
}

@end
