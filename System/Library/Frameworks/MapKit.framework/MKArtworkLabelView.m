@implementation MKArtworkLabelView

- (void)setFormattedString:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[MKServerFormattedString isEqualToServerFormattedString:](self->_formattedString, "isEqualToServerFormattedString:", v5))
  {
    objc_storeStrong((id *)&self->_formattedString, a3);
    -[_MKUILabel set_mapkit_themeColorProvider:](self, "set_mapkit_themeColorProvider:", &__block_literal_global_27);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0CEB558], *MEMORY[0x1E0CEB3D8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0CEA098];
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "multiPartAttributedStringWithAttributes:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributedString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKArtworkLabelView setAttributedText:](self, "setAttributedText:", v9);

  }
}

uint64_t __41__MKArtworkLabelView_setFormattedString___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "lightTextColor");
}

- (MKServerFormattedString)formattedString
{
  return self->_formattedString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedString, 0);
}

@end
