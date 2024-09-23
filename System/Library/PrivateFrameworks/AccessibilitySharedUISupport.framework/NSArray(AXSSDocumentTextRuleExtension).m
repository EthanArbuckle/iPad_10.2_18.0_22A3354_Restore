@implementation NSArray(AXSSDocumentTextRuleExtension)

- (BOOL)containsString:()AXSSDocumentTextRuleExtension caseSensitive:
{
  id v6;
  id v7;
  _BOOL8 v8;
  _QWORD v10[4];
  id v11;
  char v12;

  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__NSArray_AXSSDocumentTextRuleExtension__containsString_caseSensitive___block_invoke;
  v10[3] = &unk_24E077168;
  v11 = v6;
  v12 = a4;
  v7 = v6;
  v8 = objc_msgSend(a1, "indexOfObjectPassingTest:", v10) != 0x7FFFFFFFFFFFFFFFLL;

  return v8;
}

@end
