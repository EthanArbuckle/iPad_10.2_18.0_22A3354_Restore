@implementation PKSqueezePaletteViewContext

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  if (v5)
  {
    v6 = -[NSArray copyWithZone:](self->_tools, "copyWithZone:", a3);
    v7 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v6;

    v8 = -[PKTool copyWithZone:](self->_selectedTool, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v8;

    v10 = -[NSArray copyWithZone:](self->_swatchColors, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v10;

    v12 = -[UIColor copyWithZone:](self->_selectedColor, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v12;

    *(_BYTE *)(v5 + 8) = self->_supportsCanvasElements;
  }
  return (id)v5;
}

- (uint64_t)canShowTapToRadar
{
  uint64_t v2;
  id v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a1 || !os_variant_has_internal_diagnostics())
    return 0;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v4 = *(id *)(a1 + 16);
  v2 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v5 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "_isHandwritingTool", (_QWORD)v7) & 1) != 0)
        {
          v2 = 1;
          goto LABEL_15;
        }
      }
      v2 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_15:

  return v2;
}

- (uint64_t)canShowResetHandwritingEducationPane
{
  void *v1;
  uint64_t v2;

  if (result)
  {
    +[PKHandwritingEducationPaneSettings sharedInstance]();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[PKHandwritingEducationPaneSettings canShowResetPaneInPalette]((uint64_t)v1);

    return v2;
  }
  return result;
}

- (void)setSelectedColor:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_swatchColors, 0);
  objc_storeStrong((id *)&self->_selectedTool, 0);
  objc_storeStrong((id *)&self->_tools, 0);
}

@end
