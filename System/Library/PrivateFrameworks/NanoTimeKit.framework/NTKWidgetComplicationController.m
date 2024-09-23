@implementation NTKWidgetComplicationController

- (NTKWidgetComplicationController)initWithComplication:(id)a3 variant:(id)a4 device:(id)a5
{
  id v9;
  id v10;
  NTKWidgetComplicationController *v11;
  NTKWidgetComplicationController *v12;
  NSObject *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NTKWidgetComplicationController;
  v11 = -[NTKComplicationController initWithComplication:variant:device:](&v15, sel_initWithComplication_variant_device_, v9, v10, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_variant, a4);
    if (objc_msgSend(v9, "complicationType") != 56)
    {
      _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[NTKWidgetComplicationController initWithComplication:variant:device:].cold.1((uint64_t)v9, v13);

    }
    objc_storeStrong((id *)&v12->_widgetComplication, a3);
  }

  return v12;
}

- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKWidgetComplicationController;
  v6 = a4;
  -[NTKComplicationController setDisplayProperties:forDisplayWrapper:](&v7, sel_setDisplayProperties_forDisplayWrapper_, a3, v6);
  -[NTKWidgetComplicationController _updateStateForDisplayWrapper:](self, "_updateStateForDisplayWrapper:", v6, v7.receiver, v7.super_class);

}

+ (BOOL)_isLegacy
{
  return 0;
}

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5
{
  return a3 == 56;
}

- (void)addDisplayWrapper:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NTKWidgetComplication **p_widgetComplication;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKWidgetComplicationController;
  -[NTKComplicationController addDisplayWrapper:](&v11, sel_addDisplayWrapper_, v4);
  -[NTKComplicationController device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKCompanionWidgetComplicationManager instanceForDevice:](NTKCompanionWidgetComplicationManager, "instanceForDevice:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_widgetComplication = &self->_widgetComplication;
  -[NTKWidgetComplication descriptor](self->_widgetComplication, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sampleTemplateForWidget:family:", v8, -[NTKComplicationController complicationFamily](self, "complicationFamily"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "finalize");
  if (!v9)
  {
    _NTKLoggingObjectForDomain(47, (uint64_t)"NTKLoggingDomainWidget");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[NTKWidgetComplicationController addDisplayWrapper:].cold.1((id *)p_widgetComplication, v10);

  }
  objc_msgSend(v4, "setComplicationTemplate:reason:animation:", v9, 0, 0);

}

- (id)complicationApplicationIdentifier
{
  return -[NTKWidgetComplication appIdentifier](self->_widgetComplication, "appIdentifier");
}

- (Class)richComplicationDisplayViewClass
{
  return 0;
}

- (BOOL)hasTapAction
{
  return 1;
}

- (BOOL)wantsLegacyDisplay
{
  -[NTKComplicationController complicationFamily](self, "complicationFamily");
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_widgetComplication, 0);
}

- (void)initWithComplication:(uint64_t)a1 variant:(NSObject *)a2 device:.cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 138412290;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_fault_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_FAULT, "NTKWidgetComplicationController created with a complication of unsupported class %@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_4();
}

- (void)addDisplayWrapper:(id *)a1 .cold.1(id *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "Unable to find sample template for %@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_4();
}

@end
