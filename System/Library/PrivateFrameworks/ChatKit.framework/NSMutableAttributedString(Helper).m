@implementation NSMutableAttributedString(Helper)

- (void)ck_removeAttributesNotIn:()Helper
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__NSMutableAttributedString_Helper__ck_removeAttributesNotIn___block_invoke;
  v7[3] = &unk_1E274E3B8;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v7);

}

@end
