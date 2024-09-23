@implementation CKBallotLayoutAttributesCollection

- (id)copyWithZone:(_NSZone *)a3
{
  CKBallotLayoutAttributesCollection *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = objc_alloc_init(CKBallotLayoutAttributesCollection);
  v6 = -[UICollectionViewLayoutAttributes copyWithZone:](self->_ackIconAttributes, "copyWithZone:", a3);
  -[CKBallotLayoutAttributesCollection setAckIconAttributes:](v5, "setAckIconAttributes:", v6);

  v7 = -[UICollectionViewLayoutAttributes copyWithZone:](self->_containerAttributes, "copyWithZone:", a3);
  -[CKBallotLayoutAttributesCollection setContainerAttributes:](v5, "setContainerAttributes:", v7);

  v8 = -[UICollectionViewLayoutAttributes copyWithZone:](self->_voteCountAttributes, "copyWithZone:", a3);
  -[CKBallotLayoutAttributesCollection setVoteCountAttributes:](v5, "setVoteCountAttributes:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_avatarAttributesCollection, 1);
  -[CKBallotLayoutAttributesCollection setAvatarAttributesCollection:](v5, "setAvatarAttributesCollection:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_nameAttributesCollection, 1);
  -[CKBallotLayoutAttributesCollection setNameAttributesCollection:](v5, "setNameAttributesCollection:", v10);

  return v5;
}

- (void)_setContainerAttributes:(id)a3 forLayoutMode:(unint64_t)a4
{
  UICollectionViewLayoutAttributes **p_containerAttributes;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  uint64_t v15;
  uint64_t v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double MidY;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  void *v40;
  double v41;
  double v42;
  double MidX;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double MaxY;
  void *v55;
  double v56;
  double v57;
  double v58;
  double Width;
  uint64_t v60;
  double MinX;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  void *v91;
  double v92;
  double v93;
  void *v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  void *v99;
  double v100;
  CGFloat v101;
  CGFloat v102;
  void *v103;
  void *v104;
  void *v105;
  double v106;
  double v107;
  void *v108;
  void *v109;
  void *v110;
  double v111;
  double v112;
  CGFloat v113;
  CGFloat v114;
  double v115;
  double v116;
  id v117;
  UICollectionViewLayoutAttributes **v118;
  double v119;
  double v120;
  CGFloat rect;
  uint64_t rect_8;
  void *rect_24;
  uint64_t rect_24a;
  uint64_t v125;
  CKBallotLayoutAttributesCollection *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  _QWORD v138[3];
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;

  v138[1] = *MEMORY[0x1E0C80C00];
  v117 = a3;
  p_containerAttributes = &self->_containerAttributes;
  objc_storeStrong((id *)&self->_containerAttributes, a3);
  v8 = -[NSArray count](self->_avatarAttributesCollection, "count");
  v126 = self;
  v9 = -[NSArray count](self->_avatarAttributesCollection, "count");
  v10 = v9;
  v125 = v9;
  if (a4 == 1)
  {
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v15 = *MEMORY[0x1E0DC1138];
    if (v9 <= 0)
    {
      v17 = *MEMORY[0x1E0C9D648];
      v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    }
    else
    {
      v119 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v120 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v118 = &self->_containerAttributes;
      v16 = 0;
      rect = *MEMORY[0x1E0C9D648];
      v17 = *MEMORY[0x1E0C9D648];
      v116 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v18 = v116;
      rect_8 = *MEMORY[0x1E0DC1138];
      do
      {
        -[NSArray objectAtIndex:](v126->_avatarAttributesCollection, "objectAtIndex:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndex:](v126->_nameAttributesCollection, "objectAtIndex:", v16);
        rect_24 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "messageAcknowledgmentVotingAvatarSize");
        v22 = v21;
        v24 = v23;

        -[UICollectionViewLayoutAttributes frame](v126->_containerAttributes, "frame");
        MidY = CGRectGetMidY(v139);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "messageAcknowledgmentVotingAvatarSize");
        v28 = v27;
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "avatarContactImageNameMargin");
        v31 = v28 + v30;
        v137 = v15;
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "avatarNameFont");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v138[0] = v33;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v138, &v137, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("John Appleseed"), "sizeWithAttributes:", v34);
        v36 = MidY - (v31 + v35 * 0.5) * 0.5;

        if (v16)
        {
          v37 = v18;
          v38 = v17;
          v39 = v125;
          -[NSArray objectAtIndex:](v126->_avatarAttributesCollection, "objectAtIndex:", (v16 - 1) % v125);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "frame");
          v42 = v41;

        }
        else
        {
          -[UICollectionViewLayoutAttributes frame](*v118, "frame");
          MidX = CGRectGetMidX(v140);
          v141.origin.x = rect;
          v141.origin.y = v36;
          v141.size.width = v22;
          v141.size.height = v24;
          v42 = MidX + CGRectGetWidth(v141) * -0.5;
          v119 = v22;
          v120 = v24;
          v37 = v36;
          v38 = v42;
          v39 = v125;
        }
        objc_msgSend(v19, "setFrame:", v42, v36, v22, v24);
        objc_msgSend(v19, "setAlpha:", 1.0);
        objc_msgSend(v19, "setZIndex:", v8);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "avatarNameWidth");
        v46 = v45;

        v15 = rect_8;
        v135 = rect_8;
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "avatarNameFont");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v136 = v48;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("John Appleseed"), "sizeWithAttributes:", v49);
        v51 = v50;

        objc_msgSend(rect_24, "setSize:", v46, v51);
        objc_msgSend(v19, "center");
        v53 = v52;
        v142.origin.x = v42;
        v142.origin.y = v36;
        v142.size.width = v22;
        v142.size.height = v24;
        MaxY = CGRectGetMaxY(v142);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "avatarContactImageNameMargin");
        v57 = MaxY + v56;

        objc_msgSend(rect_24, "setCenter:", v53, v57);
        objc_msgSend(rect_24, "setAlpha:", 0.0);

        ++v16;
        --v8;
        v17 = v38;
        v18 = v37;
      }
      while (v39 != v16);
      v12 = v116;
      v13 = v120;
      v11 = rect;
      v14 = v119;
    }
    -[UICollectionViewLayoutAttributes frame](v126->_containerAttributes, "frame");
    v100 = CGRectGetMidX(v146);
    v147.size.width = 15.0;
    v147.size.height = 15.0;
    v147.origin.x = v11;
    v147.origin.y = v12;
    v101 = v100 - CGRectGetWidth(v147) * 0.5;
    v148.origin.x = v17;
    v148.origin.y = v18;
    v148.size.width = v14;
    v148.size.height = v13;
    v102 = CGRectGetMaxY(v148) + 1.0;
    -[UICollectionViewLayoutAttributes setFrame:](v126->_ackIconAttributes, "setFrame:", v101, v102, 15.0, 15.0);
    -[UICollectionViewLayoutAttributes setAlpha:](v126->_ackIconAttributes, "setAlpha:", 1.0);
    v133 = v15;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "messageAcknowledgmentVoteCountFont");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = v104;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("9000"), "sizeWithAttributes:", v105);
    v107 = v106;
    v131 = v15;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "messageAcknowledgmentVoteCountFont");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = v109;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v132, &v131, 1);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("9000"), "sizeWithAttributes:", v110);
    v112 = v111;

    v149.size.width = 15.0;
    v149.size.height = 15.0;
    v149.origin.x = v101;
    v149.origin.y = v102;
    v113 = CGRectGetMinX(v149) + -4.0;
    v150.origin.x = v11;
    v150.origin.y = v12;
    v150.size.width = v107;
    v150.size.height = v112;
    v114 = v113 - CGRectGetWidth(v150);
    v151.size.width = 15.0;
    v151.size.height = 15.0;
    v151.origin.x = v101;
    v151.origin.y = v102;
    v115 = CGRectGetMidY(v151);
    v152.origin.x = v114;
    v152.origin.y = v12;
    v152.size.width = v107;
    v152.size.height = v112;
    -[UICollectionViewLayoutAttributes setFrame:](v126->_voteCountAttributes, "setFrame:", v114, v115 - CGRectGetHeight(v152) * 0.5, v107, v112);
    -[UICollectionViewLayoutAttributes setAlpha:](v126->_voteCountAttributes, "setAlpha:", 1.0);
  }
  else
  {
    v58 = (double)v9 * 80.0;
    -[UICollectionViewLayoutAttributes frame](*p_containerAttributes, "frame");
    Width = CGRectGetWidth(v143);
    -[UICollectionViewLayoutAttributes frame](*p_containerAttributes, "frame");
    if (v58 >= Width)
      MinX = CGRectGetMinX(*(CGRect *)&v60);
    else
      MinX = CGRectGetMidX(*(CGRect *)&v60) + v58 * -0.5;
    -[UICollectionViewLayoutAttributes setAlpha:](self->_voteCountAttributes, "setAlpha:", 0.0);
    -[UICollectionViewLayoutAttributes setAlpha:](self->_ackIconAttributes, "setAlpha:", 0.0);
    if (v10 >= 1)
    {
      v65 = 0;
      rect_24a = *MEMORY[0x1E0DC1138];
      do
      {
        -[NSArray objectAtIndex:](self->_avatarAttributesCollection, "objectAtIndex:", v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndex:](self->_nameAttributesCollection, "objectAtIndex:", v65);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "messageAcknowledgmentVotingAvatarSize");
        v70 = v69;
        v72 = v71;

        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "messageAcknowledgmentVotingAvatarSize");
        v75 = MinX + (double)v65 * 80.0 + 40.0 - v74 * 0.5;

        -[UICollectionViewLayoutAttributes frame](self->_containerAttributes, "frame");
        v76 = CGRectGetMidY(v144);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "messageAcknowledgmentVotingAvatarSize");
        v79 = v78;
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "avatarContactImageNameMargin");
        v82 = v79 + v81;
        v129 = rect_24a;
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "avatarNameFont");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v130 = v84;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("John Appleseed"), "sizeWithAttributes:", v85);
        v87 = v76 - (v82 + v86 * 0.5) * 0.5;

        objc_msgSend(v66, "setFrame:", v75, v87, v70, v72);
        objc_msgSend(v66, "setHidden:", 0);
        objc_msgSend(v66, "setAlpha:", 1.0);
        objc_msgSend(v66, "center");
        v89 = v88;
        objc_msgSend(v66, "frame");
        v90 = CGRectGetMaxY(v145);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "avatarContactImageNameMargin");
        v93 = v90 + v92;

        objc_msgSend(v67, "setCenter:", v89, v93);
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "avatarNameWidth");
        v96 = v95;
        v127 = rect_24a;
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "avatarNameFont");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = v98;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("John Appleseed"), "sizeWithAttributes:", v99);
        objc_msgSend(v67, "setSize:", v96);

        objc_msgSend(v67, "setAlpha:", 1.0);
        objc_msgSend(v67, "setHidden:", 0);

        ++v65;
      }
      while (v125 != v65);
    }
  }

}

- (void)_applyAlphaToAllAttributesAlpha:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;

  -[CKBallotLayoutAttributesCollection containerAttributes](self, "containerAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", a3);

  -[CKBallotLayoutAttributesCollection ackIconAttributes](self, "ackIconAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", a3);

  -[CKBallotLayoutAttributesCollection voteCountAttributes](self, "voteCountAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", a3);

  -[CKBallotLayoutAttributesCollection avatarAttributesCollection](self, "avatarAttributesCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = 0;
    do
    {
      -[CKBallotLayoutAttributesCollection avatarAttributesCollection](self, "avatarAttributesCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setAlpha:", a3);
      -[CKBallotLayoutAttributesCollection nameAttributesCollection](self, "nameAttributesCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setAlpha:", a3);
      ++v10;
      -[CKBallotLayoutAttributesCollection avatarAttributesCollection](self, "avatarAttributesCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

    }
    while (v10 < v16);
  }
}

- (UICollectionViewLayoutAttributes)containerAttributes
{
  return self->_containerAttributes;
}

- (void)setContainerAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_containerAttributes, a3);
}

- (UICollectionViewLayoutAttributes)voteCountAttributes
{
  return self->_voteCountAttributes;
}

- (void)setVoteCountAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_voteCountAttributes, a3);
}

- (UICollectionViewLayoutAttributes)ackIconAttributes
{
  return self->_ackIconAttributes;
}

- (void)setAckIconAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_ackIconAttributes, a3);
}

- (NSArray)avatarAttributesCollection
{
  return self->_avatarAttributesCollection;
}

- (void)setAvatarAttributesCollection:(id)a3
{
  objc_storeStrong((id *)&self->_avatarAttributesCollection, a3);
}

- (NSArray)nameAttributesCollection
{
  return self->_nameAttributesCollection;
}

- (void)setNameAttributesCollection:(id)a3
{
  objc_storeStrong((id *)&self->_nameAttributesCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameAttributesCollection, 0);
  objc_storeStrong((id *)&self->_avatarAttributesCollection, 0);
  objc_storeStrong((id *)&self->_ackIconAttributes, 0);
  objc_storeStrong((id *)&self->_voteCountAttributes, 0);
  objc_storeStrong((id *)&self->_containerAttributes, 0);
}

@end
