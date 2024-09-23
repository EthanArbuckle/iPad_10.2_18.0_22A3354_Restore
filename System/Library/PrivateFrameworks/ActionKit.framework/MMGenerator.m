@implementation MMGenerator

- (id)generateHTML:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "markdown");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v6 = objc_msgSend(v5, "length");
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", (unint64_t)((double)v6 * 1.25));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v4, "elements", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v13, "type") == 9)
        {
          objc_msgSend(v4, "markdown");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "range");
          objc_msgSend(v14, "substringWithRange:", v15, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendString:", v17);

        }
        else
        {
          -[MMGenerator _generateHTMLForElement:inDocument:HTML:location:](self, "_generateHTMLForElement:inDocument:HTML:location:", v13, v4, v7, &v23);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)_generateHTMLForElement:(id)a3 inDocument:(id)a4 HTML:(id)a5 location:(unint64_t *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  const __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  uint64_t v33;
  const __CFString *v34;
  id v35;
  int v36;
  const __CFString *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  __CFString *v49;
  void *v50;
  void *v51;
  __CFString *v52;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  v13 = 0;
  switch(objc_msgSend(v12, "type"))
  {
    case 1u:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<h%u>"), objc_msgSend(v12, "level"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    case 2u:
      v13 = CFSTR("<p>");
      goto LABEL_46;
    case 3u:
      v13 = CFSTR("<blockquote>\n");
      goto LABEL_46;
    case 4u:
      v13 = CFSTR("<ol>\n");
      goto LABEL_46;
    case 5u:
      v13 = CFSTR("<ul>\n");
      goto LABEL_46;
    case 6u:
      v13 = CFSTR("<li>");
      goto LABEL_46;
    case 7u:
      objc_msgSend(v12, "language");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v12, "language");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("<pre><code class=\"%@\">"), v17);
        v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_36;
      }
      v13 = CFSTR("<pre><code>");
      goto LABEL_37;
    case 8u:
      v13 = CFSTR("\n<hr />\n");
      goto LABEL_46;
    case 0xAu:
      v13 = CFSTR("<br />");
      goto LABEL_46;
    case 0xBu:
      v13 = CFSTR("<del>");
      goto LABEL_46;
    case 0xCu:
      v13 = CFSTR("<strong>");
      goto LABEL_46;
    case 0xDu:
      v13 = CFSTR("<em>");
      goto LABEL_46;
    case 0xEu:
      v13 = CFSTR("<code>");
      goto LABEL_46;
    case 0xFu:
      objc_msgSend(v12, "title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v12, "href");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      __HTMLEscapedString(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      __HTMLEscapedString(v20);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v18)
      {
        objc_msgSend(v12, "title");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        __HTMLEscapedString(v23);
        v51 = v15;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("<img src=\"%@\" alt=\"%@\" title=\"%@\" />"), v17, v22, v24);
        v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();

LABEL_21:
      }
      else
      {
        objc_msgSend(v19, "stringWithFormat:", CFSTR("<img src=\"%@\" alt=\"%@\" />"), v17, v21);
        v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();

LABEL_36:
LABEL_37:

      }
      goto LABEL_46;
    case 0x10u:
      objc_msgSend(v12, "title");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = (void *)MEMORY[0x24BDD17C8];
      if (v25)
      {
        objc_msgSend(v12, "title");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        __HTMLEscapedString(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "href");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        __HTMLEscapedString(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("<a title=\"%@\" href=\"%@\">"), v28, v30);
        v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v12, "href");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        __HTMLEscapedString(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("<a href=\"%@\">"), v28);
        v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_46;
    case 0x11u:
      v31 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v12, "href");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("mailto:%@"), v51);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      __obfuscatedEmailAddress(v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "href");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      __obfuscatedEmailAddress(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("<a href=\"%@\">%@</a>"), v20, v23);
      v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    case 0x13u:
      objc_msgSend(v12, "stringValue");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    case 0x14u:
      v13 = CFSTR("<table>");
      goto LABEL_46;
    case 0x15u:
      v13 = CFSTR("<thead><tr>");
      goto LABEL_46;
    case 0x16u:
      if (objc_msgSend(v12, "alignment") == 2)
      {
        v32 = CFSTR("<th align='center'>");
        goto LABEL_44;
      }
      if (objc_msgSend(v12, "alignment") == 1)
      {
        v32 = CFSTR("<th align='left'>");
        goto LABEL_44;
      }
      v33 = objc_msgSend(v12, "alignment");
      v32 = CFSTR("<th>");
      v34 = CFSTR("<th align='right'>");
      goto LABEL_42;
    case 0x17u:
      v13 = CFSTR("<tr>");
      goto LABEL_46;
    case 0x18u:
      if (objc_msgSend(v12, "alignment") == 2)
      {
        v32 = CFSTR("<td align='center'>");
      }
      else if (objc_msgSend(v12, "alignment") == 1)
      {
        v32 = CFSTR("<td align='left'>");
      }
      else
      {
        v33 = objc_msgSend(v12, "alignment");
        v32 = CFSTR("<td>");
        v34 = CFSTR("<td align='right'>");
LABEL_42:
        if (v33 == 3)
          v32 = (__CFString *)v34;
      }
LABEL_44:
      v14 = v32;
LABEL_45:
      v13 = v14;
LABEL_46:

      v35 = v12;
      v36 = objc_msgSend(v35, "type");
      v37 = 0;
      switch(v36)
      {
        case 1:
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("</h%u>\n"), objc_msgSend(v35, "level"));
          v37 = (const __CFString *)objc_claimAutoreleasedReturnValue();
          break;
        case 2:
          v37 = CFSTR("</p>\n");
          break;
        case 3:
          v37 = CFSTR("</blockquote>\n");
          break;
        case 4:
          v37 = CFSTR("</ol>\n");
          break;
        case 5:
          v37 = CFSTR("</ul>\n");
          break;
        case 6:
          v37 = CFSTR("</li>\n");
          break;
        case 7:
          v37 = CFSTR("</code></pre>\n");
          break;
        case 11:
          v37 = CFSTR("</del>");
          break;
        case 12:
          v37 = CFSTR("</strong>");
          break;
        case 13:
          v37 = CFSTR("</em>");
          break;
        case 14:
          v37 = CFSTR("</code>");
          break;
        case 16:
          v37 = CFSTR("</a>");
          break;
        case 20:
          v37 = CFSTR("</tbody></table>");
          break;
        case 21:
          v37 = CFSTR("</tr></thead><tbody>");
          break;
        case 22:
          v37 = CFSTR("</th>");
          break;
        case 23:
          v37 = CFSTR("</tr>");
          break;
        case 24:
          v37 = CFSTR("</td>");
          break;
        default:
          break;
      }
      v49 = (__CFString *)v37;

      if (v13)
        objc_msgSend(v11, "appendString:", v13);
      v50 = v35;
      v52 = (__CFString *)v13;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      objc_msgSend(v35, "children");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      if (!v39)
        goto LABEL_81;
      v40 = v39;
      v41 = *(_QWORD *)v55;
      break;
    default:
      goto LABEL_46;
  }
  do
  {
    for (i = 0; i != v40; ++i)
    {
      if (*(_QWORD *)v55 != v41)
        objc_enumerationMutation(v38);
      v43 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
      if (objc_msgSend(v43, "type"))
      {
        if (objc_msgSend(v43, "type") != 9)
        {
          -[MMGenerator _generateHTMLForElement:inDocument:HTML:location:](self, "_generateHTMLForElement:inDocument:HTML:location:", v43, v10, v11, a6);
          continue;
        }
        objc_msgSend(v10, "markdown");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v10, "markdown");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "range");
        if (!v45)
        {
          objc_msgSend(v11, "appendString:", CFSTR("\n"));
          goto LABEL_78;
        }
      }
      v46 = objc_msgSend(v43, "range");
      objc_msgSend(v44, "substringWithRange:", v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendString:", v48);

LABEL_78:
    }
    v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
  }
  while (v40);
LABEL_81:

  if (v49)
    objc_msgSend(v11, "appendString:", v49);

}

@end
