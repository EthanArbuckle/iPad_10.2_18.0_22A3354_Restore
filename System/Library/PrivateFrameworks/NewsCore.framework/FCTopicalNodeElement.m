@implementation FCTopicalNodeElement

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t *v5;
  NSString *identifier;
  uint64_t v7;
  NSString *v8;
  BOOL v9;

  v4 = (uint64_t *)a3;
  v5 = v4;
  if (!self)
  {
    identifier = 0;
    if (v4)
      goto LABEL_3;
LABEL_6:
    v7 = 0;
    goto LABEL_4;
  }
  identifier = self->_identifier;
  if (!v4)
    goto LABEL_6;
LABEL_3:
  v7 = v4[1];
LABEL_4:
  v8 = identifier;
  v9 = -[NSString isEqualToString:](v8, "isEqualToString:", v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
