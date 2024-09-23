@implementation _INUIExtensionContext

- (_INUIExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  _INUIExtensionContext *v5;
  _INUIExtensionContext *v6;
  _INUIExtensionContextState *currentExtensionContextState;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_INUIExtensionContext;
  v5 = -[_INUIExtensionContext initWithInputItems:listenerEndpoint:contextUUID:](&v10, sel_initWithInputItems_listenerEndpoint_contextUUID_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    currentExtensionContextState = v5->_currentExtensionContextState;
    v5->_currentExtensionContextState = 0;

    objc_msgSend(MEMORY[0x1E0CBDA90], "sharedPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_updateWithExtensionContext:", v6);

  }
  return v6;
}

- (id)_errorHandlingHostProxy
{
  void *v2;
  void *v3;

  -[_INUIExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_421);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setExtensionContextState:(id)a3 completion:(id)a4
{
  _INUIExtensionContextState *v6;
  _INUIExtensionContextState *currentExtensionContextState;
  void *v8;
  id v9;

  v6 = (_INUIExtensionContextState *)a3;
  v9 = a4;
  currentExtensionContextState = self->_currentExtensionContextState;
  self->_currentExtensionContextState = v6;

  v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    v8 = v9;
  }

}

- (CGSize)hostedViewMinimumAllowedSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[_INUIExtensionContextState hostedViewMinimumAllowedSizes](self->_currentExtensionContextState, "hostedViewMinimumAllowedSizes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INUIExtensionContext _bestAllowedSizeForAllowedSizesDictionary:](self, "_bestAllowedSizeForAllowedSizesDictionary:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)hostedViewMaximumAllowedSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[_INUIExtensionContextState hostedViewMaximumAllowedSizes](self->_currentExtensionContextState, "hostedViewMaximumAllowedSizes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INUIExtensionContext _bestAllowedSizeForAllowedSizesDictionary:](self, "_bestAllowedSizeForAllowedSizesDictionary:", v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)_bestAllowedSizeForAllowedSizesDictionary:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = _INUIUtilitiesBestFittingSizeForSizeBySystemVersionDictionary(a3);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)interfaceParametersDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  _INUIExtensionContext *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INUIExtensionContextState interfaceSections](self->_currentExtensionContextState, "interfaceSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    v23 = self;
    do
    {
      -[_INUIExtensionContextState interfaceSections](self->_currentExtensionContextState, "interfaceSections");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        objc_msgSend(v3, "appendString:", CFSTR("\n\n"));
      objc_msgSend(v3, "appendFormat:", CFSTR("Section %zd:\n"), ++v6);
      objc_msgSend(v3, "appendString:", CFSTR("\tParameters:\n"));
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(v8, "parameters");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v25 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            NSStringFromClass((Class)objc_msgSend(v14, "parameterClass"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "parameterKeyPath");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "appendFormat:", CFSTR("\t\t%@ - %@\n"), v15, v16);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v11);
      }

      v17 = objc_msgSend(v8, "interactiveBehavior");
      v18 = CFSTR("None");
      if ((unint64_t)(v17 - 1) <= 2)
        v18 = off_1EA43A418[v17 - 1];
      objc_msgSend(v3, "appendFormat:", CFSTR("\tInteractive Behavior: %@"), v18);

      self = v23;
      -[_INUIExtensionContextState interfaceSections](v23->_currentExtensionContextState, "interfaceSections");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

    }
    while (v6 < v20);
  }
  v21 = (void *)objc_msgSend(v3, "copy");

  return v21;
}

- (void)_requestHandlingOfIntent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (INThisProcessHasEntitlement())
  {
    -[_INUIExtensionContext _errorHandlingHostProxy](self, "_errorHandlingHostProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestHandlingOfIntent:", v5);

  }
}

- (void)_willBeginEditing
{
  id v2;

  -[_INUIExtensionContext _errorHandlingHostProxy](self, "_errorHandlingHostProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willBeginEditing");

}

- (void)configureForParameters:(id)a3 ofInteraction:(id)a4 interactiveBehavior:(unint64_t)a5 context:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  unint64_t v22;
  unint64_t v23;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __101___INUIExtensionContext_configureForParameters_ofInteraction_interactiveBehavior_context_completion___block_invoke;
  v18[3] = &unk_1EA43A3F8;
  v18[4] = self;
  v19 = v12;
  v22 = a5;
  v23 = a6;
  v20 = v13;
  v21 = v14;
  v15 = v14;
  v16 = v13;
  v17 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], v18);

}

- (void)desiresInteractivity:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46___INUIExtensionContext_desiresInteractivity___block_invoke;
  v6[3] = &unk_1EA43A7C0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)queryRepresentedPropertiesWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66___INUIExtensionContext_queryRepresentedPropertiesWithCompletion___block_invoke;
  v6[3] = &unk_1EA43A7C0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)viewWasCancelled
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41___INUIExtensionContext_viewWasCancelled__block_invoke;
  block[3] = &unk_1EA43A918;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (_INUIRemoteViewControllerServing)viewController
{
  return (_INUIRemoteViewControllerServing *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_currentExtensionContextState, 0);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[_INUIXPCInterfaceUtilities extensionContextHostingInterface](_INUIXPCInterfaceUtilities, "extensionContextHostingInterface");
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[_INUIXPCInterfaceUtilities extensionContextVendingInterface](_INUIXPCInterfaceUtilities, "extensionContextVendingInterface");
}

@end
