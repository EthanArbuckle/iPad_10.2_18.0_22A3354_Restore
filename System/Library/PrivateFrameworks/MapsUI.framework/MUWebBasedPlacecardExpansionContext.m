@implementation MUWebBasedPlacecardExpansionContext

- (NSDictionary)context
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MUWebBasedPlacecardExpansionContext progress](self, "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("progress"));

  -[MUWebBasedPlacecardExpansionContext height](self, "height");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("height"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v6;
}

- (NSNumber)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)height
{
  return self->_height;
}

- (void)setHeight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end
