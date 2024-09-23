@implementation EMFAnchoredSearchAnchorCollection

- (EMFAnchoredSearchAnchorCollection)initWithLocaleIdentifier:(id)a3 leftHandAnchors:(id)a4 rightHandAnchors:(id)a5
{
  id v8;
  id v9;
  id v10;
  EMFAnchoredSearchAnchorCollection *v11;
  uint64_t v12;
  NSString *localeIdentifier;
  uint64_t v14;
  NSArray *leftHandAnchors;
  uint64_t v16;
  NSArray *rightHandAnchors;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EMFAnchoredSearchAnchorCollection;
  v11 = -[EMFAnchoredSearchAnchorCollection init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    localeIdentifier = v11->_localeIdentifier;
    v11->_localeIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    leftHandAnchors = v11->_leftHandAnchors;
    v11->_leftHandAnchors = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    rightHandAnchors = v11->_rightHandAnchors;
    v11->_rightHandAnchors = (NSArray *)v16;

  }
  return v11;
}

- (EMFAnchoredSearchAnchorCollection)initWithLocaleIdentifier:(id)a3
{
  return -[EMFAnchoredSearchAnchorCollection initWithLocaleIdentifier:leftHandAnchors:rightHandAnchors:](self, "initWithLocaleIdentifier:leftHandAnchors:rightHandAnchors:", a3, 0, 0);
}

- (void)setLeftHandAnchors:(id)a3
{
  NSArray *v4;
  NSArray *leftHandAnchors;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_1);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  leftHandAnchors = self->_leftHandAnchors;
  self->_leftHandAnchors = v4;

}

- (void)setRightHandAnchors:(id)a3
{
  NSArray *v4;
  NSArray *rightHandAnchors;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_1);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  rightHandAnchors = self->_rightHandAnchors;
  self->_rightHandAnchors = v4;

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMFAnchoredSearchAnchorCollection leftHandAnchors](self, "leftHandAnchors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMFAnchoredSearchAnchorCollection rightHandAnchors](self, "rightHandAnchors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:leftHandAnchors:'%@', rightHandAnchors:'%@'>"), v5, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)leftHandAnchors
{
  return self->_leftHandAnchors;
}

- (NSArray)rightHandAnchors
{
  return self->_rightHandAnchors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightHandAnchors, 0);
  objc_storeStrong((id *)&self->_leftHandAnchors, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end
