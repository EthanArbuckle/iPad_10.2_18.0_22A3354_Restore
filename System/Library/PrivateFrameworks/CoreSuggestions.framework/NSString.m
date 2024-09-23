@implementation NSString

id __70__NSString_SGNSString__sg_dataEnumeratorUsingEncoding_nullTerminated___block_invoke()
{
  return (id)objc_opt_self();
}

id __70__NSString_SGNSString__sg_dataEnumeratorUsingEncoding_nullTerminated___block_invoke_2()
{
  return (id)objc_opt_self();
}

void __70__NSString_SGNSString__sg_dataEnumeratorUsingEncoding_nullTerminated___block_invoke_3(uint64_t a1, uint64_t a2, NSRange range1, _BYTE *a4)
{
  NSUInteger length;
  NSUInteger location;
  NSRange v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  NSRange v14;
  NSRange v15;

  length = range1.length;
  location = range1.location;
  v15 = *(NSRange *)(a1 + 48);
  v14.location = location;
  v14.length = length;
  v9 = NSIntersectionRange(v14, v15);
  if (v9.length)
  {
    if (v9.length == *(_QWORD *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
      *a4 = 1;
    }
    else
    {
      v10 = objc_alloc(MEMORY[0x1E0C99D50]);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __70__NSString_SGNSString__sg_dataEnumeratorUsingEncoding_nullTerminated___block_invoke_4;
      v12[3] = &unk_1E4762030;
      v13 = *(id *)(a1 + 40);
      v11 = (void *)objc_msgSend(v10, "initWithBytesNoCopy:length:deallocator:", a2, v9.length, v12);
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);

    }
  }
}

id __70__NSString_SGNSString__sg_dataEnumeratorUsingEncoding_nullTerminated___block_invoke_4()
{
  return (id)objc_opt_self();
}

@end
