@implementation CTCall

+ (id)callForCTCallRef:(__CTCall *)a3
{
  CTCall *v4;
  CTCall *v5;
  const __CFString *v6;
  const __CFAllocator *v8;
  const __CFUUID *v9;
  const __CFUUID *v10;
  CFStringRef v11;
  __CFString *v12;

  if (!a3)
    return 0;
  v4 = objc_alloc_init(CTCall);
  if (!v4)
    return 0;
  v5 = v4;
  switch(CTCallGetStatus((uint64_t)a3))
  {
    case 1u:
    case 2u:
      v6 = CFSTR("CTCallStateConnected");
      goto LABEL_10;
    case 3u:
      v6 = CFSTR("CTCallStateDialing");
      goto LABEL_10;
    case 4u:
      v6 = CFSTR("CTCallStateIncoming");
      goto LABEL_10;
    case 5u:
      v6 = CFSTR("CTCallStateDisconnected");
LABEL_10:
      -[CTCall setCallState:](v5, "setCallState:", v6);
      break;
    default:

      v5 = 0;
      break;
  }
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v9 = CTCallCopyUUID((const __CFAllocator *)*MEMORY[0x1E0C9AE00], (uint64_t)a3);
  if (v9)
  {
    v10 = v9;
    v11 = CFUUIDCreateString(v8, v9);
    if (v11)
    {
      v12 = (__CFString *)v11;
      -[CTCall setCallID:](v5, "setCallID:", v11);

    }
    CFRelease(v10);
  }
  else
  {

    v5 = 0;
  }
  return v5;
}

+ (id)callForCXCall:(id)a3
{
  CTCall *v4;
  CTCall *v5;
  const __CFString *v6;

  if (!a3)
    return 0;
  v4 = objc_alloc_init(CTCall);
  if (!v4)
    return 0;
  v5 = v4;
  if (objc_msgSend(a3, "isOutgoing"))
    v6 = CFSTR("CTCallStateDialing");
  else
    v6 = CFSTR("CTCallStateIncoming");
  -[CTCall setCallState:](v5, "setCallState:", v6);
  if (objc_msgSend(a3, "hasConnected"))
    -[CTCall setCallState:](v5, "setCallState:", CFSTR("CTCallStateConnected"));
  if (objc_msgSend(a3, "hasEnded"))
    -[CTCall setCallState:](v5, "setCallState:", CFSTR("CTCallStateDisconnected"));
  -[CTCall setCallID:](v5, "setCallID:", objc_msgSend((id)objc_msgSend(a3, "UUID"), "UUIDString"));
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CTCall;
  -[CTCall dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CTCall (%p) {\n\tcallState: [%@]\n\tCall ID: [%@]\n}\n"), self, -[CTCall callState](self, "callState"), -[CTCall callID](self, "callID"));
}

- (BOOL)isEqual:(id)a3
{
  return -[CTCall callID](self, "callID")
      && objc_msgSend(a3, "callID")
      && -[NSString isEqualToString:](-[CTCall callID](self, "callID"), "isEqualToString:", objc_msgSend(a3, "callID"));
}

- (unint64_t)hash
{
  return -[NSString hash](self->_callID, "hash");
}

- (NSString)callState
{
  return self->_callState;
}

- (void)setCallState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)callID
{
  return self->_callID;
}

- (void)setCallID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
