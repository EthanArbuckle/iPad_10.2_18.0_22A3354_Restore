@implementation WFGetEmojiNameAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__WFGetEmojiNameAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_24F8BB768;
  v3[4] = self;
  objc_msgSend(a3, "getStringRepresentation:", v3);
}

void __51__WFGetEmojiNameAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CTFontRef v7;
  CTFontRef v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[6];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v7 = CTFontCreateWithName(CFSTR("AppleColorEmoji"), 0.0, 0);
    if (!v7)
    {
      v10 = *(void **)(a1 + 32);
      v11 = (void *)MEMORY[0x24BDD1540];
      v12 = *MEMORY[0x24BDD0B88];
      v17 = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("Failed to find the emoji font."));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 4, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "finishRunningWithError:", v15);

      goto LABEL_6;
    }
    v8 = v7;
    v9 = objc_msgSend(v5, "length");
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __51__WFGetEmojiNameAction_runAsynchronouslyWithInput___block_invoke_2;
    v16[3] = &unk_24F8B6E88;
    v16[4] = *(_QWORD *)(a1 + 32);
    v16[5] = v8;
    objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 2, v16);
    CFRelease(v8);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
LABEL_6:

}

void __51__WFGetEmojiNameAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unint64_t a4)
{
  id v6;
  Class EMFEmojiLocaleDataClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGGlyph glyphs;
  UniChar characters;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR(" ")) & 1) == 0)
  {
    if (a4 >= 4)
      a4 = 4;
    objc_msgSend(v6, "getCharacters:range:", &characters, 0, a4);
    if (CTFontGetGlyphsForCharacters(*(CTFontRef *)(a1 + 40), &characters, &glyphs, a4))
    {
      EMFEmojiLocaleDataClass = getEMFEmojiLocaleDataClass();
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localeIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[objc_class emojiLocaleDataWithLocaleIdentifier:](EMFEmojiLocaleDataClass, "emojiLocaleDataWithLocaleIdentifier:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[objc_class emojiTokenWithString:localeData:](getEMFEmojiTokenClass(), "emojiTokenWithString:localeData:", v6, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "nameForType:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 || (objc_msgSend(v11, "nameForType:", 1), (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend(*(id *)(a1 + 32), "output");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v12);

      }
    }
  }

}

@end
