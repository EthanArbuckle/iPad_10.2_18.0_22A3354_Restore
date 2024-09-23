@implementation CKAssociatedStickerTranscriptCell

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  void *v13;
  void *v14;
  objc_super v15;

  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKAssociatedStickerTranscriptCell;
  v12 = a3;
  -[CKAssociatedMessageTranscriptCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v15, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, a4, v9, a7, a6);
  objc_msgSend(v12, "sticker", v15.receiver, v15.super_class);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAssociatedStickerTranscriptCell setSticker:](self, "setSticker:", v13);

  -[CKAssociatedStickerTranscriptCell setGestureRecognizersEnabled:](self, "setGestureRecognizersEnabled:", objc_msgSend(v12, "isFromMe") ^ 1);
  -[CKAssociatedStickerTranscriptCell setIsReaction:](self, "setIsReaction:", objc_msgSend(v12, "isReaction"));
  -[CKAssociatedStickerTranscriptCell setStickerReactionIndex:](self, "setStickerReactionIndex:", objc_msgSend(v12, "stickerReactionIndex"));
  objc_msgSend(v12, "guid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKAssociatedStickerTranscriptCell setChatItemGUID:](self, "setChatItemGUID:", v14);
}

- (CKAssociatedStickerTranscriptCell)initWithFrame:(CGRect)a3
{
  CKAssociatedStickerTranscriptCell *v3;
  uint64_t v4;
  UILongPressGestureRecognizer *longPressGestureRecognizer;
  uint64_t v6;
  UITapGestureRecognizer *tapGestureRecognizer;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKAssociatedStickerTranscriptCell;
  v3 = -[CKTranscriptMessageContentCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", v3, sel_longPressGestureRecognized_);
    longPressGestureRecognizer = v3->_longPressGestureRecognizer;
    v3->_longPressGestureRecognizer = (UILongPressGestureRecognizer *)v4;

    -[UILongPressGestureRecognizer setMinimumPressDuration:](v3->_longPressGestureRecognizer, "setMinimumPressDuration:", 0.5);
    -[UILongPressGestureRecognizer setDelaysTouchesBegan:](v3->_longPressGestureRecognizer, "setDelaysTouchesBegan:", 1);
    -[UILongPressGestureRecognizer _setRequiresQuietImpulse:](v3->_longPressGestureRecognizer, "_setRequiresQuietImpulse:", 1);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v3, sel_doubleTapGestureRecognized_);
    tapGestureRecognizer = v3->_tapGestureRecognizer;
    v3->_tapGestureRecognizer = (UITapGestureRecognizer *)v6;

    -[UITapGestureRecognizer setCancelsTouchesInView:](v3->_tapGestureRecognizer, "setCancelsTouchesInView:", 0);
    -[UITapGestureRecognizer setNumberOfTapsRequired:](v3->_tapGestureRecognizer, "setNumberOfTapsRequired:", 2);
  }
  return v3;
}

- (void)setAssociatedItemView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  void *v16;
  void *v17;
  void *v18;
  _OWORD v19[8];
  objc_super v20;

  v4 = a3;
  -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAssociatedStickerTranscriptCell longPressGestureRecognizer](self, "longPressGestureRecognizer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeGestureRecognizer:", v8);

      -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKAssociatedStickerTranscriptCell tapGestureRecognizer](self, "tapGestureRecognizer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeGestureRecognizer:", v10);

    }
    v20.receiver = self;
    v20.super_class = (Class)CKAssociatedStickerTranscriptCell;
    -[CKAssociatedMessageTranscriptCell setAssociatedItemView:](&v20, sel_setAssociatedItemView_, v4);
    if (v4)
    {
      objc_msgSend(v4, "setHidden:", 0);
      objc_msgSend(v4, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      v19[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      v19[5] = v12;
      v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      v19[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      v19[7] = v13;
      v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      v19[0] = *MEMORY[0x1E0CD2610];
      v19[1] = v14;
      v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      v19[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      v19[3] = v15;
      objc_msgSend(v11, "setTransform:", v19);

      objc_msgSend(v4, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeAllAnimations");

      -[CKAssociatedStickerTranscriptCell longPressGestureRecognizer](self, "longPressGestureRecognizer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addGestureRecognizer:", v17);

      -[CKAssociatedStickerTranscriptCell tapGestureRecognizer](self, "tapGestureRecognizer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addGestureRecognizer:", v18);

      -[CKAssociatedStickerTranscriptCell setGestureRecognizersEnabled:](self, "setGestureRecognizersEnabled:", 1);
    }
  }

}

- (void)setGestureRecognizersEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL8 gestureRecognizersEnabled;
  id v7;

  if (self->_gestureRecognizersEnabled != a3)
  {
    v3 = a3;
    self->_gestureRecognizersEnabled = a3;
    -[CKAssociatedStickerTranscriptCell longPressGestureRecognizer](self, "longPressGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", v3);

    gestureRecognizersEnabled = self->_gestureRecognizersEnabled;
    -[CKAssociatedStickerTranscriptCell tapGestureRecognizer](self, "tapGestureRecognizer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", gestureRecognizersEnabled);

  }
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKAssociatedStickerTranscriptCell;
  -[CKAssociatedMessageTranscriptCell prepareForReuse](&v4, sel_prepareForReuse);
  -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[CKAssociatedStickerTranscriptCell setGestureRecognizersEnabled:](self, "setGestureRecognizersEnabled:", 1);
  -[CKAssociatedStickerTranscriptCell setSticker:](self, "setSticker:", 0);
}

- (double)rotation
{
  double result;

  +[CKAssociatedMessageChatItem rotationForGUIDHash:](CKAssociatedMessageChatItem, "rotationForGUIDHash:", -[CKAssociatedStickerTranscriptCell cachedStickerReactionRandomizationSource](self, "cachedStickerReactionRandomizationSource"));
  return result;
}

- (void)setChatItemGUID:(id)a3
{
  NSString *v4;
  NSString *chatItemGUID;

  self->_cachedStickerReactionRandomizationSource = 0;
  v4 = (NSString *)objc_msgSend(a3, "copy");
  chatItemGUID = self->_chatItemGUID;
  self->_chatItemGUID = v4;

}

- (int64_t)cachedStickerReactionRandomizationSource
{
  int64_t result;
  void *v4;

  result = self->_cachedStickerReactionRandomizationSource;
  if (!result)
  {
    -[CKAssociatedStickerTranscriptCell chatItemGUID](self, "chatItemGUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_cachedStickerReactionRandomizationSource = objc_msgSend(v4, "hash");

    return self->_cachedStickerReactionRandomizationSource;
  }
  return result;
}

- (void)layoutSubviewsForAlignmentContents
{
  void *v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  int64_t v34;
  _BOOL8 v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  char v65[56];
  char v66[56];
  _OWORD v67[3];
  uint64_t v68;
  objc_super v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;

  -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v74 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v75 = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v76 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v77 = v6;
  v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v70 = *MEMORY[0x1E0CD2610];
  v71 = v7;
  v8 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v72 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v73 = v8;
  objc_msgSend(v4, "setTransform:", &v70);

  v69.receiver = self;
  v69.super_class = (Class)CKAssociatedStickerTranscriptCell;
  -[CKAssociatedMessageTranscriptCell layoutSubviewsForAlignmentContents](&v69, sel_layoutSubviewsForAlignmentContents);
  -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;

  LODWORD(v9) = -[CKAssociatedStickerTranscriptCell isReaction](self, "isReaction");
  -[CKAssociatedMessageTranscriptCell adjustedContentAlignmentRect](self, "adjustedContentAlignmentRect");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[CKAssociatedMessageTranscriptCell size](self, "size");
  +[CKAssociatedMessageChatItem adjustedParentFrameForPositioning:forItemSize:](CKAssociatedStickerChatItem, "adjustedParentFrameForPositioning:forItemSize:", v17, v19, v21, v23, v24, v25);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  if ((_DWORD)v9)
  {
    v34 = -[CKAssociatedStickerTranscriptCell stickerReactionIndex](self, "stickerReactionIndex");
    v35 = -[CKAssociatedMessageTranscriptCell parentIsFromMe](self, "parentIsFromMe");
    -[CKAssociatedMessageTranscriptCell stickerReactionInsetsForParent](self, "stickerReactionInsetsForParent");
    +[CKAssociatedMessageChatItem locationForStickerReactionWithParentFrame:reactionIndex:parentIsFromMe:insets:](CKAssociatedMessageChatItem, "locationForStickerReactionWithParentFrame:reactionIndex:parentIsFromMe:insets:", v34, v35, v27, v29, v31, v33, v36, v37, v38, v39);
    v41 = v40;
    -[CKAssociatedMessageTranscriptCell cumulativeAssociatedOffset](self, "cumulativeAssociatedOffset");
    v43 = v41 + v42;
    -[CKAssociatedMessageTranscriptCell swipeToReplyLayoutOffset](self, "swipeToReplyLayoutOffset");
    v45 = v43 + v44;
    *(_QWORD *)&v73 = 0;
    v71 = 0u;
    v72 = 0u;
    v70 = 0u;
    -[CKAssociatedMessageTranscriptCell geometryDescriptor](self, "geometryDescriptor");
    -[CKAssociatedStickerTranscriptCell rotation](self, "rotation");
    *(_QWORD *)&v73 = v46;
    *((_QWORD *)&v72 + 1) = 0x3FF0000000000000;
    *(_QWORD *)&v70 = 12;
    v67[0] = v70;
    v67[1] = v71;
    v67[2] = v72;
    v68 = v46;
    -[CKAssociatedMessageTranscriptCell setGeometryDescriptor:](self, "setGeometryDescriptor:", v67);
  }
  else
  {
    -[CKAssociatedMessageTranscriptCell size](self, "size");
    v64 = v15;
    v47 = v13;
    v48 = v11;
    v50 = v49;
    v52 = v51;
    -[CKAssociatedMessageTranscriptCell geometryDescriptor](self, "geometryDescriptor");
    v53 = v50;
    v11 = v48;
    v13 = v47;
    v15 = v64;
    +[CKAssociatedMessageChatItem horizontalOriginForAssociatedMessageItemSize:parentFrame:geometryDescriptor:](CKAssociatedStickerChatItem, "horizontalOriginForAssociatedMessageItemSize:parentFrame:geometryDescriptor:", v66, v53, v52, v27, v29, v31, v33);
    v55 = v54;
    -[CKAssociatedMessageTranscriptCell cumulativeAssociatedOffset](self, "cumulativeAssociatedOffset");
    v57 = v56;
    -[CKAssociatedMessageTranscriptCell swipeToReplyLayoutOffset](self, "swipeToReplyLayoutOffset");
    v45 = v55 + v57 + v58;
  }
  -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKAssociatedMessageTranscriptCell parentSize](self, "parentSize");
  v61 = v60;
  v63 = v62;
  -[CKAssociatedMessageTranscriptCell geometryDescriptor](self, "geometryDescriptor");
  +[CKAssociatedMessageChatItem applyTransformToView:viewFrame:parentSize:forGeometryDescriptor:](CKAssociatedMessageChatItem, "applyTransformToView:viewFrame:parentSize:forGeometryDescriptor:", v59, v65, v45, v11, v13, v15, v61, v63);

}

- (void)layoutSubviewsForDrawer
{
  objc_super v3;

  if (-[CKEditableCollectionViewCell orientation](self, "orientation") == 2
    || -[CKTranscriptMessageCell wantsContactImageLayout](self, "wantsContactImageLayout"))
  {
    v3.receiver = self;
    v3.super_class = (Class)CKAssociatedStickerTranscriptCell;
    -[CKTranscriptMessageContentCell layoutSubviewsForDrawer](&v3, sel_layoutSubviewsForDrawer);
  }
}

- (void)performHide:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ck_performHideAnimated:completion:", 1, v4);

}

- (void)performWiggleAnimationIfNeeded
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "uniqueID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_7(&dword_18DFCD000, v2, v3, "CKAssociatedStickerTranscriptCell: Starting wobble for %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

void __67__CKAssociatedStickerTranscriptCell_performWiggleAnimationIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;

  IMLogHandleForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __67__CKAssociatedStickerTranscriptCell_performWiggleAnimationIfNeeded__block_invoke_cold_3(a1);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "sticker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (objc_msgSend(v4, "uniqueID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(*(id *)(a1 + 32), "uniqueID"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEqual:", v6),
        v6,
        v5,
        v7))
  {
    +[CKAssociatedStickerChatItem removeDroppedSticker:](CKAssociatedStickerChatItem, "removeDroppedSticker:", *(_QWORD *)(a1 + 32));
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __67__CKAssociatedStickerTranscriptCell_performWiggleAnimationIfNeeded__block_invoke_cold_2((id *)(a1 + 32));
  }
  else
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __67__CKAssociatedStickerTranscriptCell_performWiggleAnimationIfNeeded__block_invoke_cold_1(a1, v4, v8);
  }

}

- (void)performDroppedWiggle:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  _QWORD v21[8];

  v21[7] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CD2798];
  v4 = a3;
  objc_msgSend(v3, "animationWithKeyPath:", CFSTR("transform.rotation.z"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValues:", &unk_1E286FC10);
  objc_msgSend(v5, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 1.0 / (double)(unint64_t)objc_msgSend(v6, "count");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7 + v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7 * 3.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7 * 4.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7 * 5.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7 * 6.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7 * 7.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyTimes:", v15);

  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunction:", v16);

  objc_msgSend(v5, "setCalculationMode:", *MEMORY[0x1E0CD2928]);
  objc_msgSend(v5, "setDuration:", 0.6);
  objc_msgSend(v5, "setRemovedOnCompletion:", 1);
  objc_msgSend(v5, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  LODWORD(v17) = 1.0;
  objc_msgSend(v5, "setSpeed:", v17);
  -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAnimation:forKey:", v5, CFSTR("transform.rotation.z"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", 0.6);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v4);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)performReveal:(id)a3
{
  -[CKAssociatedStickerTranscriptCell performRevealAnimated:completion:](self, "performRevealAnimated:completion:", 1, a3);
}

- (void)performRevealAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ck_performRevealAnimated:completion:", v4, v6);

}

- (void)performReload:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void (**v7)(id, uint64_t);
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  _QWORD v34[4];
  id v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  double v41;
  CGRect v42;
  CGRect v43;

  v6 = (void (**)(_QWORD))a3;
  v7 = (void (**)(id, uint64_t))a4;
  -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v8, "center");
  v33 = v17;
  v31 = v18;
  if (v6)
    v6[2](v6);
  -[CKAssociatedStickerTranscriptCell setNeedsLayout](self, "setNeedsLayout");
  -[CKAssociatedStickerTranscriptCell layoutIfNeeded](self, "layoutIfNeeded");
  objc_msgSend(v8, "bounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  objc_msgSend(v8, "center");
  v32 = v27;
  v30 = v28;
  v42.origin.x = v10;
  v42.origin.y = v12;
  v42.size.width = v14;
  v42.size.height = v16;
  v43.origin.x = v20;
  v43.origin.y = v22;
  v43.size.width = v24;
  v43.size.height = v26;
  if (CGRectEqualToRect(v42, v43) || v33 == v32 && v31 == v30)
  {
    if (v7)
      v7[2](v7, 1);
  }
  else
  {
    objc_msgSend(v8, "setBounds:", v10, v12, v14, v16);
    objc_msgSend(v8, "setCenter:", v33, v31);
    v29 = (void *)MEMORY[0x1E0CEABB0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __62__CKAssociatedStickerTranscriptCell_performReload_completion___block_invoke;
    v34[3] = &unk_1E274BD00;
    v35 = v8;
    v36 = v20;
    v37 = v22;
    v38 = v24;
    v39 = v26;
    v40 = v32;
    v41 = v30;
    objc_msgSend(v29, "animateWithDuration:delay:options:animations:completion:", 0, v34, v7, 0.25, 0.0);

  }
}

uint64_t __62__CKAssociatedStickerTranscriptCell_performReload_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 72), *(double *)(a1 + 80));
}

- (void)setStickerViewHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKAssociatedMessageTranscriptCell associatedItemView](self, "associatedItemView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)doubleTapGestureRecognized:(id)a3
{
  id v4;

  -[CKAssociatedMessageTranscriptCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "associatedMessageTranscriptCellDoubleTapped:", self);

}

- (void)longPressGestureRecognized:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "state") == 1)
  {
    -[CKAssociatedMessageTranscriptCell delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "associatedMessageTranscriptCellLongTouched:", self);

  }
}

- (void)performInsertion:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (BOOL)gestureRecognizersEnabled
{
  return self->_gestureRecognizersEnabled;
}

- (IMSticker)sticker
{
  return self->_sticker;
}

- (void)setSticker:(id)a3
{
  objc_storeStrong((id *)&self->_sticker, a3);
}

- (BOOL)isReaction
{
  return self->_isReaction;
}

- (void)setIsReaction:(BOOL)a3
{
  self->_isReaction = a3;
}

- (int64_t)stickerReactionIndex
{
  return self->_stickerReactionIndex;
}

- (void)setStickerReactionIndex:(int64_t)a3
{
  self->_stickerReactionIndex = a3;
}

- (NSString)chatItemGUID
{
  return self->_chatItemGUID;
}

- (void)setCachedStickerReactionRandomizationSource:(int64_t)a3
{
  self->_cachedStickerReactionRandomizationSource = a3;
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_chatItemGUID, 0);
  objc_storeStrong((id *)&self->_sticker, 0);
}

void __67__CKAssociatedStickerTranscriptCell_performWiggleAnimationIfNeeded__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_18DFCD000, a3, OS_LOG_TYPE_DEBUG, "CKAssociatedStickerTranscriptCell: did not remove dropped sticker because sticker changed!:  %@ vs %@", (uint8_t *)&v7, 0x16u);

}

void __67__CKAssociatedStickerTranscriptCell_performWiggleAnimationIfNeeded__block_invoke_cold_2(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*a1, "uniqueID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_7(&dword_18DFCD000, v2, v3, "CKAssociatedStickerTranscriptCell: removeDroppedSticker:  %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

void __67__CKAssociatedStickerTranscriptCell_performWiggleAnimationIfNeeded__block_invoke_cold_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "uniqueID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_7(&dword_18DFCD000, v2, v3, "CKAssociatedStickerTranscriptCell: Finished wobble for %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
