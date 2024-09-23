@implementation IDSNWPathUtils

+ (id)sharedInstance
{
  if (qword_1ECDD48E8 != -1)
    dispatch_once(&qword_1ECDD48E8, &unk_1E3C1B790);
  return (id)qword_1EE40AED0;
}

- (IDSNWPathUtils)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IDSNWPathUtils;
  return -[IDSNWPathUtils init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)IDSNWPathUtils;
  -[IDSNWPathUtils dealloc](&v2, sel_dealloc);
}

- (id)getDefaultPath
{
  id v2;
  const char *v3;
  double v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;

  v2 = objc_alloc_init(MEMORY[0x1E0CCECA0]);
  objc_msgSend_prohibitInterfaceSubtype_(v2, v3, 5001, v4);
  v5 = objc_alloc(MEMORY[0x1E0CCECB0]);
  v8 = (void *)objc_msgSend_initWithEndpoint_parameters_(v5, v6, 0, v7, v2);
  objc_msgSend_path(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)filterVirtualInterfaces:(char *)a3
{
  NSObject *v3;
  NSObject *v4;
  void *evaluator_for_endpoint;
  NSObject *v6;
  _BOOL4 v7;

  v3 = nw_parameters_create();
  v4 = nw_interface_create_with_name();
  nw_parameters_require_interface(v3, v4);

  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  v6 = nw_path_evaluator_copy_path();
  if (nw_path_uses_interface_type(v6, nw_interface_type_wifi)
    || nw_path_uses_interface_type(v6, nw_interface_type_cellular))
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v7 = !nw_path_uses_interface_type(v6, nw_interface_type_wired);
  }

  return v7;
}

- (BOOL)isVoWiFiInterface:(char *)a3
{
  NSObject *v3;
  NSObject *v4;
  xpc_object_t v5;
  xpc_object_t v6;
  void *evaluator_for_endpoint;
  NSObject *v8;
  BOOL v9;

  v3 = nw_parameters_create();
  v4 = nw_interface_create_with_name();
  nw_parameters_require_interface(v3, v4);

  v5 = xpc_array_create(0, 0);
  v6 = xpc_array_create(0, 0);
  xpc_array_set_string(v5, 0xFFFFFFFFFFFFFFFFLL, "TelephonyIPSec");
  xpc_array_set_string(v6, 0xFFFFFFFFFFFFFFFFLL, "TelephonyIPSec");
  nw_parameters_set_prohibited_netagent_classes();
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  v8 = nw_path_evaluator_copy_path();
  v9 = nw_path_get_status(v8) == nw_path_status_unsatisfied && nw_path_get_reason() == 10;

  return v9;
}

- (void)bringUpSlicedInterface:(id)a3 forServiceIdentifier:(id)a4
{
  id v6;
  const char *v7;
  double v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  void *evaluator_for_endpoint;
  double v16;
  NSObject *v17;
  void (**v18)(id, void *);
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint8_t buf[16];

  v6 = a3;
  if (objc_msgSend_isEqualToString_(a4, v7, (uint64_t)CFSTR("com.apple.private.alloy.facetime.multi"), v8))
  {
    v9 = nw_parameters_create();
    objc_msgSend_UTF8String(CFSTR("com.apple.facetime"), v10, v11, v12);
    nw_parameters_set_source_application_by_bundle_id();
    nw_parameters_set_service_class(v9, nw_service_class_interactive_voice);
    nw_parameters_set_required_interface_type(v9, nw_interface_type_cellular);
    evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
    if (evaluator_for_endpoint)
    {
      objc_msgSend_NWPathUtils(IDSFoundationLog, v13, v14, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B949000, v17, OS_LOG_TYPE_DEFAULT, "Bringing Up Sliced Cellular Interface!", buf, 2u);
      }

      v23 = MEMORY[0x1E0C809B0];
      v18 = (void (**)(id, void *))v6;
      nw_path_evaluator_set_update_handler();
      nw_path_evaluator_start();
      objc_storeWeak((id *)&self->_slicedInterfaceEvaluator, evaluator_for_endpoint);
      v19 = (void *)nw_path_evaluator_copy_path();
      objc_msgSend__updateSlicedInterfaceName_(self, v20, (uint64_t)v19, v21, v23, 3221225472, sub_19BA255E8, &unk_1E3C208B8, self);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
        v18[2](v18, v22);

    }
  }

}

- (void)takeDownSlicedInterface
{
  uint64_t v2;
  double v3;
  NSObject *v5;
  id WeakRetained;
  uint8_t v7[16];

  objc_msgSend_NWPathUtils(IDSFoundationLog, a2, v2, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19B949000, v5, OS_LOG_TYPE_DEFAULT, "Taking Down Sliced Cellular Interface!", v7, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_slicedInterfaceEvaluator);
  nw_path_evaluator_cancel();

}

- (id)_updateSlicedInterfaceName:(id)a3
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  NSObject *v7;
  void *v8;
  size_t count;
  size_t i;
  const uint8_t *uuid;
  id v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  NSObject *v19;
  id v20;
  _QWORD enumerate_block[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_19BA25938;
  v27 = sub_19BA25948;
  v28 = 0;
  if (nw_path_get_status(v3) == nw_path_status_satisfied)
  {
    objc_msgSend_NWPathUtils(IDSFoundationLog, v4, v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v7, OS_LOG_TYPE_DEFAULT, "Sliced Cellular Interface Path Satisfied!", buf, 2u);
    }

    enumerate_block[0] = MEMORY[0x1E0C809B0];
    enumerate_block[1] = 3221225472;
    enumerate_block[2] = sub_19BA25950;
    enumerate_block[3] = &unk_1E3C208E0;
    enumerate_block[4] = &v23;
    nw_path_enumerate_interfaces(v3, enumerate_block);
  }
  else if (nw_path_get_status(v3) == nw_path_status_satisfiable)
  {
    v8 = (void *)nw_path_copy_inactive_agent_uuids();
    count = xpc_array_get_count(v8);
    if (count)
    {
      for (i = 0; i != count; ++i)
      {
        uuid = xpc_array_get_uuid(v8, i);
        v12 = objc_alloc(MEMORY[0x1E0CB3A28]);
        v15 = (void *)objc_msgSend_initWithUUIDBytes_(v12, v13, (uint64_t)uuid, v14);
        objc_msgSend_NWPathUtils(IDSFoundationLog, v16, v17, v18);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v15;
          _os_log_impl(&dword_19B949000, v19, OS_LOG_TYPE_DEFAULT, "Asserting Net Agent :%@ for Sliced Cellular Interface!", buf, 0xCu);
        }

        nw_path_assert_agent();
      }
    }

  }
  v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v20;
}

- (OS_nw_path_evaluator)slicedInterfaceEvaluator
{
  return (OS_nw_path_evaluator *)objc_loadWeakRetained((id *)&self->_slicedInterfaceEvaluator);
}

- (void)setSlicedInterfaceEvaluator:(id)a3
{
  objc_storeWeak((id *)&self->_slicedInterfaceEvaluator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_slicedInterfaceEvaluator);
}

@end
