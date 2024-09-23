@implementation PKTextInputDebugStateIntrospector

- (PKTextInputDebugStateIntrospector)initWithInteraction:(id)a3
{
  id v4;
  PKTextInputDebugStateIntrospector *v5;
  PKTextInputDebugStateIntrospector *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTextInputDebugStateIntrospector;
  v5 = -[PKTextInputDebugStateIntrospector init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_interaction, v4);
    objc_msgSend((id)objc_opt_class(), "_knownInstances");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v6);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend((id)objc_opt_class(), "_knownInstances");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKTextInputDebugStateIntrospector;
  -[PKTextInputDebugStateIntrospector dealloc](&v4, sel_dealloc);
}

+ (id)_knownInstances
{
  if (qword_1ECEE6490 != -1)
    dispatch_once(&qword_1ECEE6490, &__block_literal_global_72);
  return (id)_MergedGlobals_149;
}

void __52__PKTextInputDebugStateIntrospector__knownInstances__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithWeakObjects");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_149;
  _MergedGlobals_149 = v0;

}

+ (id)debugStateLineDescriptionForIntrospectable:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__PKTextInputDebugStateIntrospector_debugStateLineDescriptionForIntrospectable___block_invoke;
  v9[3] = &unk_1E777C790;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "reportDebugStateDescription:", v9);

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __80__PKTextInputDebugStateIntrospector_debugStateLineDescriptionForIntrospectable___block_invoke(uint64_t a1, uint64_t a2, const __CFString *a3)
{
  const __CFString *v4;
  id v5;

  v4 = CFSTR("(nil)");
  if (a3)
    v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), a2, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (id)fullDebugStateDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugStateIntrospector debugStateKeys](self, "debugStateKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[PKTextInputDebugStateIntrospector debugStateTitleForStateKey:](self, "debugStateTitleForStateKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTextInputDebugStateIntrospector debugStateDescriptionForStateKey:](self, "debugStateDescriptionForStateKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("== %@ ==\n%@\n\n"), v10, v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

+ (void)debugStateDidChange
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(a1, "_knownInstances", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "_debugStateDidChange");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_debugStateDidChange
{
  id v3;

  -[PKTextInputDebugStateIntrospector delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "debugStateIntrospectorContentDidChange:", self);

}

- (id)debugStateKeys
{
  if (qword_1ECEE64A0 != -1)
    dispatch_once(&qword_1ECEE64A0, &__block_literal_global_14_2);
  return (id)qword_1ECEE6498;
}

void __51__PKTextInputDebugStateIntrospector_debugStateKeys__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECEE6498;
  qword_1ECEE6498 = (uint64_t)&unk_1E77ECDC0;

}

- (id)debugStateTitleForStateKey:(id)a3
{
  return a3;
}

- (id)debugStateDetailViewControllerForStateKey:(id)a3
{
  void *v3;
  void *v4;

  -[PKTextInputDebugStateIntrospector _introspectableForStateKey:](self, "_introspectableForStateKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "debugStateDetailViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)debugStateCanShowDetailsForStateKey:(id)a3
{
  void *v3;
  char v4;

  -[PKTextInputDebugStateIntrospector _introspectableForStateKey:](self, "_introspectableForStateKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "debugStateCanDisplayDetails");
  else
    v4 = 0;

  return v4;
}

- (id)debugStateDescriptionForStateKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[PKTextInputDebugStateIntrospector _introspectableForStateKey:](self, "_introspectableForStateKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 12.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__PKTextInputDebugStateIntrospector_debugStateDescriptionForStateKey___block_invoke;
  v12[3] = &unk_1E777C7B8;
  v13 = v5;
  v7 = v6;
  v14 = v7;
  v8 = v5;
  objc_msgSend(v3, "reportDebugStateDescription:", v12);
  if ((unint64_t)objc_msgSend(v7, "length") >= 2)
    objc_msgSend(v7, "deleteCharactersInRange:", objc_msgSend(v7, "length") - 1, 1);
  v9 = v14;
  v10 = v7;

  return v10;
}

void __70__PKTextInputDebugStateIntrospector_debugStateDescriptionForStateKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  __CFString *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = (objc_class *)MEMORY[0x1E0CB3498];
  v6 = a3;
  v7 = a2;
  v8 = [v5 alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (id)objc_msgSend(v8, "initWithString:attributes:", v9, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", v15);
  v10 = *(void **)(a1 + 40);
  v11 = objc_alloc(MEMORY[0x1E0CB3498]);
  v12 = CFSTR("(nil)");
  if (v6)
    v12 = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v11, "initWithString:attributes:", v13, 0);
  objc_msgSend(v10, "appendAttributedString:", v14);

}

- (id)_introspectableForStateKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("Interaction Controller")))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("Actions Logging")))
    {
      -[PKTextInputDebugStateIntrospector interaction](self, "interaction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "debugLogController");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Canvas Controller")))
    {
      -[PKTextInputDebugStateIntrospector interaction](self, "interaction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "canvasController");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Gesture Recognizer")))
    {
      -[PKTextInputDebugStateIntrospector interaction](self, "interaction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "drawingGestureRecognizer");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("Handwriting Controller")))
      {
        if (objc_msgSend(v4, "isEqualToString:", CFSTR("Active Input Target")))
        {
          -[PKTextInputDebugStateIntrospector interaction](self, "interaction");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "handwritingController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "debugActiveInputTargetState");
          v10 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v4, "isEqualToString:", CFSTR("Recognition Manager")))
          {
            if (objc_msgSend(v4, "isEqualToString:", CFSTR("Cursor Controller")))
            {
              -[PKTextInputDebugStateIntrospector interaction](self, "interaction");
              v6 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "cursorController");
              v7 = objc_claimAutoreleasedReturnValue();
            }
            else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Reserve Space Controller")))
            {
              -[PKTextInputDebugStateIntrospector interaction](self, "interaction");
              v6 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "reserveSpaceController");
              v7 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (!objc_msgSend(v4, "isEqualToString:", CFSTR("Elements Controller")))
              {
                v5 = 0;
                goto LABEL_13;
              }
              -[PKTextInputDebugStateIntrospector interaction](self, "interaction");
              v6 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "elementsController");
              v7 = objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_11;
          }
          -[PKTextInputDebugStateIntrospector interaction](self, "interaction");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "handwritingController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "debugRecognitionManager");
          v10 = objc_claimAutoreleasedReturnValue();
        }
        v5 = (void *)v10;

        goto LABEL_12;
      }
      -[PKTextInputDebugStateIntrospector interaction](self, "interaction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handwritingController");
      v7 = objc_claimAutoreleasedReturnValue();
    }
LABEL_11:
    v5 = (void *)v7;
LABEL_12:

    goto LABEL_13;
  }
  -[PKTextInputDebugStateIntrospector interaction](self, "interaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v5;
}

- (PKTextInputInteraction)interaction
{
  return (PKTextInputInteraction *)objc_loadWeakRetained((id *)&self->_interaction);
}

- (PKTextInputDebugStateIntrospectorDelegate)delegate
{
  return (PKTextInputDebugStateIntrospectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_interaction);
}

@end
