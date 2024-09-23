@implementation MNRouteDivergenceOverlappingSection

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[MNRouteDivergenceOverlappingSection components](self, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)components
{
  return self->_components;
}

- (void)setComponents:(id)a3
{
  objc_storeStrong((id *)&self->_components, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
}

@end
