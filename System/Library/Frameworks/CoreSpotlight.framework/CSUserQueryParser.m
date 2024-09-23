@implementation CSUserQueryParser

- (id)_CSQueryCreateQueryDictionaryWithOptionsDict:(id)a3 attribute:(id)a4 input:(id)a5 options:(unsigned int)a6
{
  if (a5)
    return (id)__MDQueryCreateQueryDictionaryWithOptionsDict();
  else
    return MEMORY[0x1E0C9AA70];
}

- (void)_CSUserQueryCancelQueryWithReferenceDict:(id)a3
{
  __MDQueryParserCancelWithReferenceDict();
}

@end
