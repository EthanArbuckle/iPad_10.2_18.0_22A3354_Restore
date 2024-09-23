@implementation NTKMonogramTimelineEntryModel

- (id)templateForComplicationFamily:(int64_t)a3
{
  return -[NTKMonogramTimelineEntryModel _newSimpleTextTemplate](self, "_newSimpleTextTemplate", a3);
}

- (id)_newSimpleTextTemplate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C94530];
  -[NTKMonogramTimelineEntryModel monogram](self, "monogram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textProviderWithText:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C94458], "templateWithTextProvider:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)monogram
{
  return self->_monogram;
}

- (void)setMonogram:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogram, 0);
}

@end
