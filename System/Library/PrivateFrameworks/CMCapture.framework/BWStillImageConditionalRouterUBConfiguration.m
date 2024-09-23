@implementation BWStillImageConditionalRouterUBConfiguration

+ (id)configurationWithPortTypes:(id)a3
{
  return -[BWStillImageConditionalRouterUBConfiguration initWithPortTypes:]([BWStillImageConditionalRouterUBConfiguration alloc], a3);
}

- (_QWORD)initWithPortTypes:(_QWORD *)a1
{
  _QWORD *v2;
  _QWORD v5[5];
  objc_super v6;

  v2 = a1;
  if (a1)
  {
    if (objc_msgSend(a2, "count"))
    {
      v6.receiver = v2;
      v6.super_class = (Class)BWStillImageConditionalRouterUBConfiguration;
      v2 = objc_msgSendSuper2(&v6, sel_initWithNumberOfOutputs_, objc_msgSend(a2, "count"));
      if (v2)
      {
        v2[5] = a2;
        v5[0] = MEMORY[0x1E0C809B0];
        v5[1] = 3221225472;
        v5[2] = __66__BWStillImageConditionalRouterUBConfiguration_initWithPortTypes___block_invoke;
        v5[3] = &unk_1E491FD48;
        v5[4] = a2;
        objc_msgSend(v2, "setShouldEmitSampleBufferDecisionProvider:", v5);
      }
    }
    else
    {
      FigDebugAssert3();

      return 0;
    }
  }
  return v2;
}

BOOL __66__BWStillImageConditionalRouterUBConfiguration_initWithPortTypes___block_invoke(uint64_t a1, CMAttachmentBearerRef target, _DWORD *a3)
{
  uint64_t v4;

  v4 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]));
  if (a3 && v4 != 0x7FFFFFFFFFFFFFFFLL)
    *a3 = v4;
  return v4 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageConditionalRouterUBConfiguration;
  -[BWStillImageConditionalRouterConfiguration dealloc](&v3, sel_dealloc);
}

- (unint64_t)outputIndexForPortType:(id)a3
{
  return -[NSArray indexOfObject:](self->_portTypes, "indexOfObject:", a3);
}

- (NSArray)portTypes
{
  return self->_portTypes;
}

@end
