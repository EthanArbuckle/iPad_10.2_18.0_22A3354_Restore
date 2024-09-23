@implementation MCMResultDiskUsageForContainer

- (MCMResultDiskUsageForContainer)initWithDiskUsageBytes:(unint64_t)a3 descendants:(unint64_t)a4 containerClass:(unint64_t)a5 personaType:(int)a6
{
  MCMResultDiskUsageForContainer *v10;
  MCMResultDiskUsageForContainer *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)MCMResultDiskUsageForContainer;
  v10 = -[MCMResultBase init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_diskUsageBytes = a3;
    v10->_descendants = a4;
    v10->_containerClass = a5;
    v10->_personaType = a6;
    -[MCMResultDiskUsageForContainer _report](v10, "_report");
  }
  return v11;
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MCMResultDiskUsageForContainer;
  v5 = -[MCMResultBase encodeResultOntoReply:](&v8, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    -[MCMResultBase error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      xpc_dictionary_set_uint64(v4, "ReplyDiskUsage", -[MCMResultDiskUsageForContainer diskUsageBytes](self, "diskUsageBytes"));
  }

  return v5;
}

- (void)_report
{
  unint64_t v3;
  unint64_t v4;
  int personaType;
  unint64_t containerClass;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  _QWORD v10[8];
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = -[MCMResultDiskUsageForContainer _roundToTwoSignificantDigitsWithNumber:](self, "_roundToTwoSignificantDigitsWithNumber:", self->_descendants);
  v4 = -[MCMResultDiskUsageForContainer _roundToTwoSignificantDigitsWithNumber:](self, "_roundToTwoSignificantDigitsWithNumber:", self->_diskUsageBytes);
  personaType = self->_personaType;
  containerClass = self->_containerClass;
  container_log_handle_for_category();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, self);

  objc_msgSend((id)objc_opt_class(), "_reportingWorkloop");
  v9 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__MCMResultDiskUsageForContainer__report__block_invoke;
  v10[3] = &__block_descriptor_68_e5_v8__0l;
  v11 = personaType;
  v10[4] = containerClass;
  v10[5] = v8;
  v10[6] = v3;
  v10[7] = v4;
  dispatch_async(v9, v10);

}

- (unint64_t)_roundToTwoSignificantDigitsWithNumber:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;

  v3 = (double)a3;
  v4 = log10((double)a3);
  v5 = __exp10(ceil(v4) + -2.0);
  return (unint64_t)(v5 * floor(v3 / v5 + 0.5));
}

- (unint64_t)diskUsageBytes
{
  return self->_diskUsageBytes;
}

- (void)setDiskUsageBytes:(unint64_t)a3
{
  self->_diskUsageBytes = a3;
}

- (unint64_t)descendants
{
  return self->_descendants;
}

- (void)setDescendants:(unint64_t)a3
{
  self->_descendants = a3;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (void)setContainerClass:(unint64_t)a3
{
  self->_containerClass = a3;
}

- (int)personaType
{
  return self->_personaType;
}

- (void)setPersonaType:(int)a3
{
  self->_personaType = a3;
}

void __41__MCMResultDiskUsageForContainer__report__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 == 7)
  {
    v10 = *(_DWORD *)(a1 + 64);
    if (v10 == 1)
    {
      container_log_handle_for_category();
      v21 = objc_claimAutoreleasedReturnValue();
      v5 = v21;
      v6 = *(_QWORD *)(a1 + 40);
      if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v21))
        goto LABEL_29;
      v22 = *(_QWORD *)(a1 + 48);
      v23 = *(_QWORD *)(a1 + 56);
      v27 = 134349312;
      v28 = v22;
      v29 = 2050;
      v30 = v23;
      v9 = "DiskUsage_Managed_appGroup";
    }
    else
    {
      if (v10)
        return;
      container_log_handle_for_category();
      v11 = objc_claimAutoreleasedReturnValue();
      v5 = v11;
      v6 = *(_QWORD *)(a1 + 40);
      if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v11))
        goto LABEL_29;
      v12 = *(_QWORD *)(a1 + 48);
      v13 = *(_QWORD *)(a1 + 56);
      v27 = 134349312;
      v28 = v12;
      v29 = 2050;
      v30 = v13;
      v9 = "DiskUsage_appGroup";
    }
    goto LABEL_28;
  }
  if (v2 != 4)
  {
    if (v2 != 2)
      return;
    v3 = *(_DWORD *)(a1 + 64);
    if (v3 == 1)
    {
      container_log_handle_for_category();
      v18 = objc_claimAutoreleasedReturnValue();
      v5 = v18;
      v6 = *(_QWORD *)(a1 + 40);
      if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v18))
        goto LABEL_29;
      v19 = *(_QWORD *)(a1 + 48);
      v20 = *(_QWORD *)(a1 + 56);
      v27 = 134349312;
      v28 = v19;
      v29 = 2050;
      v30 = v20;
      v9 = "DiskUsage_Managed_appData";
    }
    else
    {
      if (v3)
        return;
      container_log_handle_for_category();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = *(_QWORD *)(a1 + 40);
      if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v4))
        goto LABEL_29;
      v7 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 56);
      v27 = 134349312;
      v28 = v7;
      v29 = 2050;
      v30 = v8;
      v9 = "DiskUsage_appData";
    }
    goto LABEL_28;
  }
  v14 = *(_DWORD *)(a1 + 64);
  if (v14 == 1)
  {
    container_log_handle_for_category();
    v24 = objc_claimAutoreleasedReturnValue();
    v5 = v24;
    v6 = *(_QWORD *)(a1 + 40);
    if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v24))
      goto LABEL_29;
    v25 = *(_QWORD *)(a1 + 48);
    v26 = *(_QWORD *)(a1 + 56);
    v27 = 134349312;
    v28 = v25;
    v29 = 2050;
    v30 = v26;
    v9 = "DiskUsage_Managed_pluginData";
    goto LABEL_28;
  }
  if (v14)
    return;
  container_log_handle_for_category();
  v15 = objc_claimAutoreleasedReturnValue();
  v5 = v15;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 56);
    v27 = 134349312;
    v28 = v16;
    v29 = 2050;
    v30 = v17;
    v9 = "DiskUsage_pluginData";
LABEL_28:
    _os_signpost_emit_with_name_impl(&dword_1CF807000, v5, OS_SIGNPOST_EVENT, v6, v9, " enableTelemetry=YES  descendants=%{public, signpost.telemetry:number1}llu bytes=%{public, signpost.telemetry:number2}llu", (uint8_t *)&v27, 0x16u);
  }
LABEL_29:

}

+ (id)_reportingWorkloop
{
  if (_reportingWorkloop_onceToken != -1)
    dispatch_once(&_reportingWorkloop_onceToken, &__block_literal_global_12921);
  return (id)_reportingWorkloop_workloop;
}

void __52__MCMResultDiskUsageForContainer__reportingWorkloop__block_invoke()
{
  dispatch_workloop_t v0;
  void *v1;

  v0 = dispatch_workloop_create("com.apple.containermanagerd.disk-usage-reporting");
  v1 = (void *)_reportingWorkloop_workloop;
  _reportingWorkloop_workloop = (uint64_t)v0;

}

@end
