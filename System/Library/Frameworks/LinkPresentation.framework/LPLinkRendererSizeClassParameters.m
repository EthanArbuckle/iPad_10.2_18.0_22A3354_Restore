@implementation LPLinkRendererSizeClassParameters

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPLinkRendererSizeClassParameters)initWithCoder:(id)a3
{
  id v4;
  LPLinkRendererSizeClassParameters *v5;
  double v6;
  double v7;
  double v8;
  LPLinkRendererSizeClassParameters *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LPLinkRendererSizeClassParameters;
  v5 = -[LPLinkRendererSizeClassParameters init](&v11, sel_init);
  if (v5)
  {
    v5->_alignButtonWithCaptionTextLeadingEdge = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("alignButtonWithCaptionTextLeadingEdge"));
    v5->_preserveIconAspectRatioAndAlignmentWhenScaling = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("preserveIconAspectRatioAndAlignmentWhenScaling"));
    v5->_onlyShowIcon = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onlyShowIcon"));
    v5->_neverShowIcon = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("neverShowIcon"));
    v5->_disableTextWrapping = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disableTextWrapping"));
    v5->_useDominantColorForText = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useDominantColorForText"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minimumMediaCornerRadius"));
    v5->_minimumMediaCornerRadius = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minimumIconCornerRadius"));
    v5->_minimumIconCornerRadius = v7;
    v5->_alignTextAndMediaHorizontalEdges = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("alignTextAndMediaHorizontalEdges"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("mediaFixedAspectRatio"));
    v5->_mediaFixedAspectRatio = v8;
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", self->_alignButtonWithCaptionTextLeadingEdge, CFSTR("alignButtonWithCaptionTextLeadingEdge"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_preserveIconAspectRatioAndAlignmentWhenScaling, CFSTR("preserveIconAspectRatioAndAlignmentWhenScaling"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_onlyShowIcon, CFSTR("onlyShowIcon"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_neverShowIcon, CFSTR("neverShowIcon"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_disableTextWrapping, CFSTR("disableTextWrapping"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_useDominantColorForText, CFSTR("useDominantColorForText"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("minimumMediaCornerRadius"), self->_minimumMediaCornerRadius);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("minimumIconCornerRadius"), self->_minimumIconCornerRadius);
  objc_msgSend(v4, "encodeBool:forKey:", self->_alignTextAndMediaHorizontalEdges, CFSTR("alignTextAndMediaHorizontalEdges"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("mediaFixedAspectRatio"), self->_mediaFixedAspectRatio);

}

- (BOOL)alignButtonWithCaptionTextLeadingEdge
{
  return self->_alignButtonWithCaptionTextLeadingEdge;
}

- (void)setAlignButtonWithCaptionTextLeadingEdge:(BOOL)a3
{
  self->_alignButtonWithCaptionTextLeadingEdge = a3;
}

- (BOOL)preserveIconAspectRatioAndAlignmentWhenScaling
{
  return self->_preserveIconAspectRatioAndAlignmentWhenScaling;
}

- (void)setPreserveIconAspectRatioAndAlignmentWhenScaling:(BOOL)a3
{
  self->_preserveIconAspectRatioAndAlignmentWhenScaling = a3;
}

- (BOOL)onlyShowIcon
{
  return self->_onlyShowIcon;
}

- (void)setOnlyShowIcon:(BOOL)a3
{
  self->_onlyShowIcon = a3;
}

- (BOOL)neverShowIcon
{
  return self->_neverShowIcon;
}

- (void)setNeverShowIcon:(BOOL)a3
{
  self->_neverShowIcon = a3;
}

- (BOOL)disableTextWrapping
{
  return self->_disableTextWrapping;
}

- (void)setDisableTextWrapping:(BOOL)a3
{
  self->_disableTextWrapping = a3;
}

- (BOOL)useDominantColorForText
{
  return self->_useDominantColorForText;
}

- (void)setUseDominantColorForText:(BOOL)a3
{
  self->_useDominantColorForText = a3;
}

- (double)minimumMediaCornerRadius
{
  return self->_minimumMediaCornerRadius;
}

- (void)setMinimumMediaCornerRadius:(double)a3
{
  self->_minimumMediaCornerRadius = a3;
}

- (double)minimumIconCornerRadius
{
  return self->_minimumIconCornerRadius;
}

- (void)setMinimumIconCornerRadius:(double)a3
{
  self->_minimumIconCornerRadius = a3;
}

- (BOOL)alignTextAndMediaHorizontalEdges
{
  return self->_alignTextAndMediaHorizontalEdges;
}

- (void)setAlignTextAndMediaHorizontalEdges:(BOOL)a3
{
  self->_alignTextAndMediaHorizontalEdges = a3;
}

- (double)mediaFixedAspectRatio
{
  return self->_mediaFixedAspectRatio;
}

- (void)setMediaFixedAspectRatio:(double)a3
{
  self->_mediaFixedAspectRatio = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  double *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPLinkRendererSizeClassParameters;
  if (-[LPLinkRendererSizeClassParameters isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (double *)v4;
      v5 = *((unsigned __int8 *)v6 + 8) == self->_alignButtonWithCaptionTextLeadingEdge
        && *((unsigned __int8 *)v6 + 9) == self->_preserveIconAspectRatioAndAlignmentWhenScaling
        && *((unsigned __int8 *)v6 + 10) == self->_onlyShowIcon
        && *((unsigned __int8 *)v6 + 11) == self->_neverShowIcon
        && *((unsigned __int8 *)v6 + 12) == self->_disableTextWrapping
        && *((unsigned __int8 *)v6 + 13) == self->_useDominantColorForText
        && v6[2] == self->_minimumMediaCornerRadius
        && v6[3] == self->_minimumIconCornerRadius
        && *((unsigned __int8 *)v6 + 14) == self->_alignTextAndMediaHorizontalEdges
        && v6[4] == self->_mediaFixedAspectRatio;

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  LPLinkRendererSizeClassParameters *v4;
  LPLinkRendererSizeClassParameters *v5;

  v4 = +[LPLinkRendererSizeClassParameters allocWithZone:](LPLinkRendererSizeClassParameters, "allocWithZone:", a3);
  if (v4)
  {
    -[LPLinkRendererSizeClassParameters setAlignButtonWithCaptionTextLeadingEdge:](v4, "setAlignButtonWithCaptionTextLeadingEdge:", -[LPLinkRendererSizeClassParameters alignButtonWithCaptionTextLeadingEdge](self, "alignButtonWithCaptionTextLeadingEdge"));
    -[LPLinkRendererSizeClassParameters setPreserveIconAspectRatioAndAlignmentWhenScaling:](v4, "setPreserveIconAspectRatioAndAlignmentWhenScaling:", -[LPLinkRendererSizeClassParameters preserveIconAspectRatioAndAlignmentWhenScaling](self, "preserveIconAspectRatioAndAlignmentWhenScaling"));
    -[LPLinkRendererSizeClassParameters setOnlyShowIcon:](v4, "setOnlyShowIcon:", -[LPLinkRendererSizeClassParameters onlyShowIcon](self, "onlyShowIcon"));
    -[LPLinkRendererSizeClassParameters setNeverShowIcon:](v4, "setNeverShowIcon:", -[LPLinkRendererSizeClassParameters neverShowIcon](self, "neverShowIcon"));
    -[LPLinkRendererSizeClassParameters setDisableTextWrapping:](v4, "setDisableTextWrapping:", -[LPLinkRendererSizeClassParameters disableTextWrapping](self, "disableTextWrapping"));
    -[LPLinkRendererSizeClassParameters setUseDominantColorForText:](v4, "setUseDominantColorForText:", -[LPLinkRendererSizeClassParameters useDominantColorForText](self, "useDominantColorForText"));
    -[LPLinkRendererSizeClassParameters minimumMediaCornerRadius](self, "minimumMediaCornerRadius");
    -[LPLinkRendererSizeClassParameters setMinimumMediaCornerRadius:](v4, "setMinimumMediaCornerRadius:");
    -[LPLinkRendererSizeClassParameters minimumIconCornerRadius](self, "minimumIconCornerRadius");
    -[LPLinkRendererSizeClassParameters setMinimumIconCornerRadius:](v4, "setMinimumIconCornerRadius:");
    -[LPLinkRendererSizeClassParameters setAlignTextAndMediaHorizontalEdges:](v4, "setAlignTextAndMediaHorizontalEdges:", -[LPLinkRendererSizeClassParameters alignTextAndMediaHorizontalEdges](self, "alignTextAndMediaHorizontalEdges"));
    -[LPLinkRendererSizeClassParameters mediaFixedAspectRatio](self, "mediaFixedAspectRatio");
    -[LPLinkRendererSizeClassParameters setMediaFixedAspectRatio:](v4, "setMediaFixedAspectRatio:");
    v5 = v4;
  }

  return v4;
}

- (id)_cacheKey
{
  void *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  double v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[LPLinkRendererSizeClassParameters alignButtonWithCaptionTextLeadingEdge](self, "alignButtonWithCaptionTextLeadingEdge");
  v5 = -[LPLinkRendererSizeClassParameters preserveIconAspectRatioAndAlignmentWhenScaling](self, "preserveIconAspectRatioAndAlignmentWhenScaling");
  v6 = -[LPLinkRendererSizeClassParameters onlyShowIcon](self, "onlyShowIcon");
  v7 = -[LPLinkRendererSizeClassParameters disableTextWrapping](self, "disableTextWrapping");
  -[LPLinkRendererSizeClassParameters minimumMediaCornerRadius](self, "minimumMediaCornerRadius");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%d%d%d%d%d%d"), v4, v5, v6, v7, (int)v8, -[LPLinkRendererSizeClassParameters alignTextAndMediaHorizontalEdges](self, "alignTextAndMediaHorizontalEdges"));
}

@end
