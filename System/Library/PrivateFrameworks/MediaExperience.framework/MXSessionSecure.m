@implementation MXSessionSecure

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sNonSerializedCopyProperties_0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("AudioBehaviour"), CFSTR("AudioCategory"), CFSTR("AudioMode"), CFSTR("AudioToolboxIsPlaying"), CFSTR("AuditToken"), CFSTR("ClientName"), CFSTR("ClientPID"), CFSTR("ClientPriority"), CFSTR("AudioSessionID"), CFSTR("CoreSessionID"), CFSTR("CurrentInputSampleRate"), CFSTR("MXSessionID"), CFSTR("ReporterIDs"), 0);
    sNonSerializedSetProperties_0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("AuditToken"), CFSTR("ClientName"), CFSTR("ReporterIDs"), 0);
    sNonSerializedSetPropertiesWhenSessionIsInactive_0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("AudioCategory"), CFSTR("AudioMode"), CFSTR("ClientPID"), CFSTR("AudioSessionID"), 0);
    sOrderedMXSessionSecureProperties = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithObjects:", CFSTR("ClientName"), CFSTR("AudioSessionID"), CFSTR("AudioCategory"), CFSTR("AudioMode"), 0);
  }
}

+ (BOOL)isNonSerializedCopyProperty:(id)a3
{
  return objc_msgSend((id)sNonSerializedCopyProperties_0, "containsObject:", a3);
}

+ (BOOL)isNonSerializedSetProperty:(id)a3
{
  return objc_msgSend((id)sNonSerializedSetProperties_0, "containsObject:", a3);
}

+ (BOOL)isNonSerializedSetPropertyWhenSessionIsInactive:(id)a3
{
  return objc_msgSend((id)sNonSerializedSetPropertiesWhenSessionIsInactive_0, "containsObject:", a3);
}

+ (id)getSetPropertiesOrder
{
  return (id)sOrderedMXSessionSecureProperties;
}

- (MXSessionSecure)initWithOptions:(id)a3
{
  MXSessionSecure *v4;
  MXCoreSessionSecure *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  objc_super v8;
  id location[17];

  location[16] = *(id *)MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)MXSessionSecure;
  v4 = -[MXSessionBase init](&v8, sel_init);
  if (v4)
  {
    if (a3
      && (v5 = -[MXCoreSessionSecure initWithOptions:]([MXCoreSessionSecure alloc], "initWithOptions:", a3)) != 0)
    {
      -[MXSessionBase setParentCoreSession:](v4, "setParentCoreSession:", v5);

      objc_initWeak(location, v4);
      -[MXCoreSessionBase addMXSessionSecure:](-[MXSessionBase parentCoreSession](v4, "parentCoreSession"), "addMXSessionSecure:", objc_loadWeak(location));
      objc_destroyWeak(location);
    }
    else
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[MXCoreSessionBase addMXSessionSecure:](-[MXSessionBase parentCoreSession](self, "parentCoreSession"), "addMXSessionSecure:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MXSessionSecure;
  -[MXSessionBase dealloc](&v3, sel_dealloc);
}

- (int)copyPropertyForKeyInternal:(id)a3 valueOut:(id *)a4
{
  NSNumber *v7;

  if (!a3)
    return FigSignalErrorAt();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !a4)
    return FigSignalErrorAt();
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AudioToolboxIsPlaying")))
  {
    v7 = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 0);
LABEL_8:
    *a4 = v7;
    return 0;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("MXSessionID")))
  {
    v7 = -[MXSessionBase ID](self, "ID");
    goto LABEL_8;
  }
  return -[MXCoreSessionBase copyPropertyForKey:valueOut:](-[MXSessionBase parentCoreSession](self, "parentCoreSession"), "copyPropertyForKey:valueOut:", a3, a4);
}

- (int)setPropertyForKeyInternal:(id)a3 value:(id)a4 fromPropertiesBatch:(id)a5
{
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    return -[MXCoreSessionBase setPropertyForKey:value:](-[MXSessionBase parentCoreSession](self, "parentCoreSession"), "setPropertyForKey:value:", a3, a4);
  else
    return FigSignalErrorAt();
}

- (int)_beginInterruptionWithSecTask:(__SecTask *)a3 andFlags:(unint64_t)a4
{
  return -[MXCoreSessionBase _beginInterruptionWithSecTask:andFlags:](-[MXSessionBase parentCoreSession](self, "parentCoreSession"), "_beginInterruptionWithSecTask:andFlags:", a3, a4);
}

- (int)_endInterruptionWithSecTask:(__SecTask *)a3 andStatus:(id)a4
{
  return -[MXCoreSessionBase _endInterruptionWithSecTask:andStatus:](-[MXSessionBase parentCoreSession](self, "parentCoreSession"), "_endInterruptionWithSecTask:andStatus:", a3, a4);
}

- (void)logDebugInfo
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;

  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1EE2B3F38)
    {
      v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      if (dword_1EE2B3F38)
      {
        v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        if (dword_1EE2B3F38)
        {
          v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
    }
  }
}

@end
