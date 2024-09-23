@implementation LAContextUITrampoline

+ (void)evaluateAccessControl:(__SecAccessControl *)a3 context:(id)a4 operation:(int64_t)a5 options:(id)a6 presentationContext:(id)a7 reply:(id)a8
{
  objc_msgSend(a4, "evaluateAccessControl:operation:options:presentationContext:reply:", a3, a5, a6, a7, a8);
}

@end
