@implementation NSMutableURLRequest(WFFormEncoding)

- (void)wf_setBodyWithQueryItems:()WFFormEncoding
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "setValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded"), CFSTR("Content-Type"));
  WFHTTPBodyFromQueryItems(v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setHTTPBody:", v5);
}

@end
