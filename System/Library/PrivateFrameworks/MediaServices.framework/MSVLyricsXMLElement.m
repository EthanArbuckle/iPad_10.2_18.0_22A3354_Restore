@implementation MSVLyricsXMLElement

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MSVLyricsXMLElement elementName](self, "elementName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSVLyricsXMLElement identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> Name: %@, identifier: %@"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)elementName
{
  return self->_elementName;
}

- (void)setElementName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableString)mutableText
{
  return self->_mutableText;
}

- (void)setMutableText:(id)a3
{
  objc_storeStrong((id *)&self->_mutableText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableText, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_elementName, 0);
}

@end
