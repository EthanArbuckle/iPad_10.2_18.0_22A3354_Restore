@implementation _BSUIAnimationAttributesFactory

- (double)duration
{
  return 0.0;
}

- (double)delay
{
  return 0.0;
}

- (unint64_t)hash
{
  return -[_UIViewAnimationAttributes hash](self->_attributes, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  char v6;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
    v6 = -[_UIViewAnimationAttributes isEqual:](self->_attributes, "isEqual:", v4[3]);
  else
    v6 = 0;

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p attributes=%@>"), objc_opt_class(), self, self->_attributes);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
