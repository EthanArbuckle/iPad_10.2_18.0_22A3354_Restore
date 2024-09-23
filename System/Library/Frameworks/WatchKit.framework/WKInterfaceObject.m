@implementation WKInterfaceObject

- (WKInterfaceObject)init
{

  return 0;
}

- (id)_initWithInterfaceProperty:(id)a3 viewControllerID:(id)a4 propertyIndex:(int64_t)a5 tableIndex:(int64_t)a6 rowIndex:(int64_t)a7
{
  int v9;
  id v11;
  id v12;
  WKInterfaceObject *v13;
  void *v14;
  objc_super v16;

  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WKInterfaceObject;
  v11 = a4;
  v12 = a3;
  v13 = -[WKInterfaceObject init](&v16, sel_init);
  -[WKInterfaceObject setInterfaceProperty:](v13, "setInterfaceProperty:", v12);

  -[WKInterfaceObject setViewControllerID:](v13, "setViewControllerID:", v11);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), (v9 + 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject setPropertyIndex:](v13, "setPropertyIndex:", v14);

  -[WKInterfaceObject setRowIndex:](v13, "setRowIndex:", a7);
  -[WKInterfaceObject setTableIndex:](v13, "setTableIndex:", a6);
  return v13;
}

- (void)_setImage:(id)a3 forProperty:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  +[SPRemoteInterface SerializablePropertyValue:](SPRemoteInterface, "SerializablePropertyValue:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[SPCompanionAssetCache sharedInstance](SPCompanionAssetCache, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "keyFromImageData:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[SPCompanionAssetCache sharedInstance](SPCompanionAssetCache, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "imageInTransientCache:", v9);

    if (v11)
    {
      -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v9, v6);
    }
    else
    {
      v14[0] = CFSTR("a");
      v14[1] = CFSTR("d");
      v15[0] = v9;
      v15[1] = v7;
      v14[2] = CFSTR("t");
      v15[2] = &unk_24D3CB3D8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v12, v6);
      +[SPCompanionAssetCache sharedInstance](SPCompanionAssetCache, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addImageReferenceToTransientCache:withName:", v7, v9);

    }
  }

}

- (void)_setImageData:(id)a3 forProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    +[SPCompanionAssetCache sharedInstance](SPCompanionAssetCache, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "keyFromImageData:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[SPCompanionAssetCache sharedInstance](SPCompanionAssetCache, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "imageInTransientCache:", v9);

    if (v11)
    {
      -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v9, v7);
    }
    else
    {
      v14[0] = CFSTR("a");
      v14[1] = CFSTR("d");
      v15[0] = v9;
      v15[1] = v6;
      v14[2] = CFSTR("t");
      v15[2] = &unk_24D3CB3D8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v12, v7);
      +[SPCompanionAssetCache sharedInstance](SPCompanionAssetCache, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addImageReferenceToTransientCache:withName:", v6, v9);

    }
  }

}

- (void)_setImageNamed:(id)a3 forProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[SPCompanionAssetCache sharedInstance](SPCompanionAssetCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataForImageWithName:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v11[0] = CFSTR("a");
    v11[1] = CFSTR("d");
    v12[0] = v6;
    v12[1] = v9;
    v11[2] = CFSTR("t");
    v12[2] = &unk_24D3CB3F0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v10, v7);

  }
  else
  {
    -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v6, v7);
  }

}

- (void)_sendValueChanged:(id)a3
{
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", a3, &stru_24D3BD200);
}

- (void)_sendValueChanged:(id)a3 forProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v6 = a4;
  v7 = a3;
  -[WKInterfaceObject propertyIndex](self, "propertyIndex");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (-[WKInterfaceObject tableIndex](self, "tableIndex") >= 1
    && -[WKInterfaceObject tableIndex](self, "tableIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[WKInterfaceObject tableIndex](self, "tableIndex"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingPathComponent:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v10;
  }
  if (-[WKInterfaceObject rowIndex](self, "rowIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[WKInterfaceObject rowIndex](self, "rowIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingPathComponent:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v13;
  }
  -[WKInterfaceObject viewControllerID](self, "viewControllerID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SPRemoteInterface setController:key:property:value:](SPRemoteInterface, "setController:key:property:value:", v14, v15, v6, v7);

}

- (void)setHidden:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("hn"));

}

- (void)setAlpha:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("ap"));

}

- (void)setWidth:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("wd"));

}

- (void)setHeight:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("ht"));

}

- (void)setRelativeWidth:(double)a3 withAdjustment:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v8, CFSTR("rw"));

}

- (void)setRelativeHeight:(double)a3 withAdjustment:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v8, CFSTR("rh"));

}

- (void)sizeToFitWidth
{
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", &unk_24D3CB450, CFSTR("wd"));
}

- (void)sizeToFitHeight
{
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", &unk_24D3CB450, CFSTR("ht"));
}

- (void)setHorizontalAlignment:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("ha"));

}

- (void)setVerticalAlignment:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("va"));

}

- (void)setRotation:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("ro"));

}

- (NSString)interfaceProperty
{
  return self->_interfaceProperty;
}

- (void)setInterfaceProperty:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)viewControllerID
{
  return self->_viewControllerID;
}

- (void)setViewControllerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)propertyIndex
{
  return self->_propertyIndex;
}

- (void)setPropertyIndex:(id)a3
{
  objc_storeStrong((id *)&self->_propertyIndex, a3);
}

- (int64_t)tableIndex
{
  return self->_tableIndex;
}

- (void)setTableIndex:(int64_t)a3
{
  self->_tableIndex = a3;
}

- (int64_t)rowIndex
{
  return self->_rowIndex;
}

- (void)setRowIndex:(int64_t)a3
{
  self->_rowIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyIndex, 0);
  objc_storeStrong((id *)&self->_viewControllerID, 0);
  objc_storeStrong((id *)&self->_interfaceProperty, 0);
}

- (void)setAccessibilityIdentifier:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("Ai"));

}

- (void)setAccessibilityLabel:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("Al"));

}

- (void)setAccessibilityHint:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("Ah"));

}

- (void)setAccessibilityValue:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("Av"));

}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("Ae"));

}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v4, CFSTR("At"));

}

- (void)setAccessibilityImageRegions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v11, "label", (_QWORD)v25);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "frame");
          v14 = v13;
          v16 = v15;
          v18 = v17;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v19);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v20);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v21);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v22);

          objc_msgSend(v11, "label");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v23, "copy");
          objc_msgSend(v5, "addObject:", v24);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  -[WKInterfaceObject _sendValueChanged:forProperty:](self, "_sendValueChanged:forProperty:", v5, CFSTR("Ar"));
}

@end
